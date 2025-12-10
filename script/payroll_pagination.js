// payroll_pagination.js
import { createEmployeeRowFirstTable, createEmployeeRowSecondTable } from './payroll_rows.js';
import { computeTotalsForRange, computeTotals2ForRange, createPageTotalRowsFirst, createPageTotalRowsSecond } from './payroll_totals.js';

// Paginate employees and render Table 1 and Table 2 as separate pages.
export function paginateAndRenderTables(employees) {
    const perPage = 25;
    const totalEmployees = employees.length;
    const tablePages = Math.max(1, Math.ceil(totalEmployees / perPage));

    const grandTotals1 = computeTotalsForRange(employees, 0, totalEmployees);
    const grandTotals2 = computeTotals2ForRange(employees, 0, totalEmployees);

    const originalFirstPage = document.querySelector('.pagefirst');
    const firstTableTheadTemplate = originalFirstPage ? originalFirstPage.querySelector('.payroll-table thead') : document.querySelector('.payroll-table:first-of-type thead');
    const secondTableTheadTemplate = document.querySelector('.second-page .payroll-table thead');
    const certTemplate = document.querySelector('.pageBelow1st');

    const container = document.getElementById('pdf-content');
    container.innerHTML = '';

    const totalPagesOverall = tablePages * 2;
    const pagePadding = '10px';
    // Sheet logic: each pair of pages (first table + second table) is one sheet
    const totalSheets = tablePages;
    let currentSheet = 1;

    if (originalFirstPage) {
        const firstClone = originalFirstPage.cloneNode(true);
        const firstTbl = firstClone.querySelector('.payroll-table');
        if (firstTbl) {
            const existingTbody = firstTbl.querySelector('tbody');
            if (existingTbody) existingTbody.remove();
            const newTbody = document.createElement('tbody');

            const start = 0;
            const end = Math.min(perPage, totalEmployees);
            const chunk = employees.slice(start, end);
            chunk.forEach((emp, idx) => newTbody.appendChild(createEmployeeRowFirstTable(emp, start + idx + 1)));

            const pageTotals = computeTotalsForRange(employees, start, end);
            createPageTotalRowsFirst(pageTotals, false).forEach(r => newTbody.appendChild(r));

            if (tablePages === 1) createPageTotalRowsFirst(grandTotals1, true).forEach(r => newTbody.appendChild(r));

            firstTbl.appendChild(newTbody);
        }

        if (tablePages > 1) {
            const certBlock = firstClone.querySelector('.pageBelow1st');
            if (certBlock) certBlock.remove();
        } else {
            const certBlockInFirst = firstClone.querySelector('.pageBelow1st');
            if (certBlockInFirst) {
                const certSpacer = document.createElement('div');
                certSpacer.className = 'cert-spacer';
                certSpacer.style.height = '40px';
                certBlockInFirst.parentNode.insertBefore(certSpacer, certBlockInFirst);
            }
        }

        // Show sheet number only on the first page of each sheet (first table page)
        const sheetNoEl = firstClone.querySelector('#sheet-no');
        const totalSheetsEl = firstClone.querySelector('#total-sheets');
        if (sheetNoEl) sheetNoEl.textContent = 1;
        if (totalSheetsEl) totalSheetsEl.textContent = totalSheets;

        firstClone.style.pageBreakAfter = (currentSheet < totalPagesOverall) ? 'always' : 'auto';
        firstClone.style.breakAfter = 'page';
        firstClone.style.pageBreakInside = 'avoid';
        firstClone.style.breakInside = 'avoid';
        firstClone.style.padding = pagePadding;
        firstClone.style.boxSizing = 'border-box';

        container.appendChild(firstClone);
        currentSheet++;
    }

    // Remaining Table 1 pages
    for (let p = 1; p < tablePages; p++) {
        const start = p * perPage;
        const end = Math.min(start + perPage, totalEmployees);
        const chunk = employees.slice(start, end);

        const pageDiv = document.createElement('div');
        pageDiv.className = 'table-page table1-page';
        pageDiv.style.pageBreakBefore = 'always';
        pageDiv.style.pageBreakAfter = (currentSheet < totalPagesOverall) ? 'always' : 'auto';
        pageDiv.style.breakBefore = 'page';
        pageDiv.style.breakAfter = (currentSheet < totalPagesOverall) ? 'page' : 'auto';
        pageDiv.style.pageBreakInside = 'avoid';
        pageDiv.style.breakInside = 'avoid';
        pageDiv.style.padding = pagePadding;
        pageDiv.style.boxSizing = 'border-box';

        const tbl = document.createElement('table');
        tbl.className = 'payroll-table';
        if (firstTableTheadTemplate) tbl.appendChild(firstTableTheadTemplate.cloneNode(true));

        const tbody = document.createElement('tbody');
        chunk.forEach((emp, idx) => tbody.appendChild(createEmployeeRowFirstTable(emp, start + idx + 1)));
        const pageTotals = computeTotalsForRange(employees, start, end);
        createPageTotalRowsFirst(pageTotals, false).forEach(r => tbody.appendChild(r));

        tbl.appendChild(tbody);
        tbl.style.width = '100%';
        tbl.style.margin = '0';
        pageDiv.appendChild(tbl);

        // Show sheet number only on the first table page of each sheet
        const sheetNoEl = pageDiv.querySelector('#sheet-no');
        const totalSheetsEl = pageDiv.querySelector('#total-sheets');
        if (sheetNoEl && totalSheetsEl) {
            // Sheet number is (p+1)
            sheetNoEl.textContent = (p + 1);
            totalSheetsEl.textContent = totalSheets;
            sheetNoEl.parentNode.style.display = '';
        } else if (sheetNoEl) {
            sheetNoEl.parentNode.style.display = 'none';
        }

        if (p === tablePages - 1) {
            createPageTotalRowsFirst(grandTotals1, true).forEach(r => tbody.appendChild(r));
            if (certTemplate) {
                const certClone = certTemplate.cloneNode(true);
                const certSpacer = document.createElement('div');
                certSpacer.className = 'cert-spacer';
                certSpacer.style.height = '40px';
                pageDiv.appendChild(certSpacer);
                pageDiv.appendChild(certClone);
            }
        }

        container.appendChild(pageDiv);
        currentSheet++;
    }

    // Table 2 pages
    for (let p = 0; p < tablePages; p++) {
        const start = p * perPage;
        const end = Math.min(start + perPage, totalEmployees);
        const chunk = employees.slice(start, end);

        const pageDiv = document.createElement('div');
        pageDiv.className = 'table-page table2-page';
        pageDiv.style.pageBreakBefore = 'always';
        pageDiv.style.pageBreakAfter = (currentSheet < totalPagesOverall) ? 'always' : 'auto';
        pageDiv.style.breakBefore = 'page';
        pageDiv.style.breakAfter = (currentSheet < totalPagesOverall) ? 'page' : 'auto';
        pageDiv.style.pageBreakInside = 'avoid';
        pageDiv.style.breakInside = 'avoid';
        pageDiv.style.padding = pagePadding;
        pageDiv.style.boxSizing = 'border-box';

        if (p === 0) {
            pageDiv.classList.add('table2-first');
            const spacer = document.createElement('div');
            spacer.className = 'table2-spacer';
            spacer.style.height = '115px';
            spacer.style.width = '100%';
            pageDiv.appendChild(spacer);
        }

        const tbl = document.createElement('table');
        tbl.className = 'payroll-table';
        if (secondTableTheadTemplate) tbl.appendChild(secondTableTheadTemplate.cloneNode(true));

        const tbody = document.createElement('tbody');
        chunk.forEach((emp, idx) => tbody.appendChild(createEmployeeRowSecondTable(emp, start + idx + 1)));

        const pageTotals2 = computeTotals2ForRange(employees, start, end);
        createPageTotalRowsSecond(pageTotals2, false).forEach(r => tbody.appendChild(r));

        // Show sheet number only on the first page of each sheet (second table page)
        const sheetNoEl = pageDiv.querySelector('#sheet-no');
        const totalSheetsEl = pageDiv.querySelector('#total-sheets');
        if (sheetNoEl && totalSheetsEl) {
            // Sheet number is (p+1)
            sheetNoEl.textContent = (p + 1);
            totalSheetsEl.textContent = totalSheets;
            sheetNoEl.parentNode.style.display = '';
        } else if (sheetNoEl) {
            sheetNoEl.parentNode.style.display = 'none';
        }

        if (p === tablePages - 1) {
            createPageTotalRowsSecond(grandTotals2, true).forEach(r => tbody.appendChild(r));
        }

        tbl.appendChild(tbody);
        pageDiv.appendChild(tbl);
        container.appendChild(pageDiv);
        currentSheet++;
    }
}
