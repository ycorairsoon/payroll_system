// payroll_renderer.js
import { formatDate } from './payroll_utils.js';
import { generatePDF } from './payroll_pdf.js';
import { paginateAndRenderTables } from './payroll_pagination.js';
import { updateApproveForPaymentAmount } from './payroll_totals.js';

// Expose a single entry function to populate the page
export function setupDownloadButton() {
    const btn = document.getElementById('download-pdf');
    if (!btn) return;

    // Replace button to remove old handlers
    const newBtn = btn.cloneNode(true);
    btn.parentNode.replaceChild(newBtn, btn);
    newBtn.addEventListener('click', () => generatePDF());
}

export function populatePayrollData(data) {
    if (!data) return;
    const p = data.periodInfo || {};

    const el = (id) => document.getElementById(id);
    if (el('date_start')) el('date_start').textContent = formatDate(p.date_start);
    if (el('date_end')) el('date_end').textContent = formatDate(p.date_end);
    if (el('responsibility')) el('responsibility').textContent = p.responsibility_title || '';
    if (el('payrollNo')) el('payrollNo').textContent = p.PayrollMstID || '';
    if (el('office')) el('office').textContent = p.office_title || '';

    const cert = data.certifications || {};
    if (el('cert_a')) el('cert_a').textContent = cert.cert_a || '';
    if (el('cert_b')) el('cert_b').textContent = cert.cert_b || '';
    if (el('cert_c')) el('cert_c').textContent = cert.cert_c || '';
    if (el('cert_d')) el('cert_d').textContent = cert.cert_d || '';
    if (el('cert_correct')) el('cert_correct').textContent = cert.cert_correct || '';

    // Render tables (pagination and totals)
    paginateAndRenderTables(data.employees || []);
    // Update approve-for-payment after pagination rendered
    updateApproveForPaymentAmount();
    // Re-bind download button because we rebuild the DOM
    setupDownloadButton();
}
