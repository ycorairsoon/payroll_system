// payroll_totals.js
import { formatCurrency } from './payroll_utils.js';

// Compute totals for the first table over employees[start..end)
export function computeTotalsForRange(employees, start, end) {
    const totals = {
        p_salaries: 0,
        p_pera: 0,
        p_gross: 0,
        p_tardiness: 0,
        p_tax: 0,
        p_philper: 0,
        p_philgovt: 0,
        p_pagper: 0,
        p_paggovt: 0,
        p_pag2: 0,
        p_gsis_per: 0,
        p_gsis_govt: 0,
        p_ecc: 0,
        p_mpl: 0,
        p_housing: 0,
        p_lotpurchase: 0,
        p_dues: 0,
        p_otherdues: 0,
        p_coop: 0
    };

    for (let i = start; i < end; i++) {
        const emp = employees[i] || {};
        totals.p_salaries += Number(emp.Salary || 0);
        totals.p_pera += Number(emp.PERA || 0);
        totals.p_gross += Number(emp.GrossIncome || 0);
        totals.p_tardiness += Number(emp.Tardiness || 0);
        totals.p_tax += Number(emp.IncomeTaxWithHeld || 0);
        totals.p_philper += Number(emp.PHIC_EmployeeShare || 0);
        totals.p_philgovt += Number(emp.PHIC_EmployerShare || 0);
        totals.p_pagper += Number(emp.PAGIBIG_EmployeeShare || 0);
        totals.p_paggovt += Number(emp.PAGIBIG_EmployerShare || 0);
        totals.p_pag2 += Number(emp.PAGIBIG_II || 0);
        totals.p_gsis_per += Number(emp.GSIS_EmployeeShare || 0);
        totals.p_gsis_govt += Number(emp.GSIS_EmployerShare || 0);
        totals.p_ecc += Number(emp.GSIS_ECC || 0);
        totals.p_mpl += Number(emp.PAGIBIG_MPL || 0);
        totals.p_housing += Number(emp.PAGIBIG_Housing || 0);
        totals.p_lotpurchase += Number(emp.PAGIBIG_LotPurchase || 0);
        totals.p_dues += Number(emp.GSCGEA_Dues || 0);
        totals.p_otherdues += Number(emp.GSCGEA_OtherDues || 0);
        totals.p_coop += Number(emp.GSCCoop || 0);
    }

    return totals;
}

// Compute totals for the second table over employees[start..end)
export function computeTotals2ForRange(employees, start, end) {
    const totals = {
        p_gsis_mpl: 0,
        p_ceap: 0,
        p_comp: 0,
        p_mpl_lite: 0,
        p_pl_reg: 0,
        p_gsis_el: 0,
        p_gfal: 0,
        p_lbp_tot: 0,
        p_gross_gov_ded: 0,
        p_gross_per_ded: 0,
        p_net_pay: 0,
        p_first_half: 0,
        p_second_half: 0
    };

    for (let i = start; i < end; i++) {
        const emp = employees[i] || {};
        totals.p_gsis_mpl += Number(emp.GSIS_MPL || 0);
        totals.p_ceap += Number(emp.ceap || 0);
        totals.p_comp += Number(emp.GSIS_ComputerLoan || 0);
        totals.p_mpl_lite += Number(emp.GSIS_MPLLite || 0);
        totals.p_pl_reg += Number(emp.GSIS_PolicyLoanRegular || 0);
        totals.p_gsis_el += Number(emp.GSIS_EmergencyLoan || 0);
        totals.p_gfal += Number(emp.GSIS_GFAL || 0);
        totals.p_lbp_tot += Number(emp.BankLoan_LBP || 0);
        totals.p_gross_gov_ded += Number(emp.GrossDeductionGovernment || 0);
        totals.p_gross_per_ded += Number(emp.GrossDeductionPersonal || 0);
        totals.p_net_pay += Number(emp.NetPay || 0);
        totals.p_first_half += Number(emp.NetPay1stHalf || 0);
        totals.p_second_half += Number(emp.NetPay2ndHalf || 0);
    }

    return totals;
}

// Create page total rows for the first table (returns array of TR elements)
export function createPageTotalRowsFirst(totals, isGrand) {
    const row1 = document.createElement('tr');
    row1.className = 'expandable total-row';
    row1.innerHTML = `
        <td colspan="4" rowspan="2">${isGrand ? 'Grand Total:' : 'Page Total:'}</td>
        <td>${formatCurrency(totals.p_salaries)}</td>
        <td>${formatCurrency(totals.p_pera)}</td>
        <td rowspan="2">${formatCurrency(totals.p_gross)}</td>
        <td rowspan="2">${formatCurrency(totals.p_tardiness)}</td>
        <td rowspan="2">${formatCurrency(totals.p_tax)}</td>
        <td>${formatCurrency(totals.p_philper)}</td>
        <td>${formatCurrency(totals.p_philgovt)}</td>
        <td>${formatCurrency(totals.p_pagper)}</td>
        <td>${formatCurrency(totals.p_paggovt)}</td>
        <td>${formatCurrency(totals.p_pag2)}</td>
        <td>${formatCurrency(totals.p_gsis_per)}</td>
        <td>${formatCurrency(totals.p_gsis_govt)}</td>
        <td>${formatCurrency(totals.p_ecc)}</td>
        <td>${formatCurrency(totals.p_mpl)}</td>
        <td>${formatCurrency(totals.p_housing)}</td>
        <td>${formatCurrency(totals.p_lotpurchase)}</td>
        <td>${formatCurrency(totals.p_dues)}</td>
        <td>${formatCurrency(totals.p_otherdues)}</td>
        <td>${formatCurrency(totals.p_coop)}</td>
    `;

    const row2 = document.createElement('tr');
    row2.className = 'expandable total-row';
    row2.innerHTML = `
        <td colspan="2">${formatCurrency(totals.p_salaries + totals.p_pera)}</td>
        <td colspan="2">${formatCurrency(totals.p_philper + totals.p_philgovt)}</td>
        <td colspan="3">${formatCurrency(totals.p_pagper + totals.p_paggovt + totals.p_pag2)}</td>
        <td colspan="3">${formatCurrency(totals.p_gsis_per + totals.p_gsis_govt + totals.p_ecc)}</td>
        <td colspan="3">${formatCurrency(totals.p_mpl + totals.p_housing + totals.p_lotpurchase)}</td>
        <td colspan="3">${formatCurrency(totals.p_dues + totals.p_otherdues + totals.p_coop)}</td>
    `;

    return [row1, row2];
}

// Create page total rows for the second table (returns array of TR elements)
export function createPageTotalRowsSecond(totals, isGrand) {
    const row1 = document.createElement('tr');
    row1.className = 'expandable total-row';
    row1.innerHTML = `
        <td colspan="4" rowspan="2">${isGrand ? 'Grand Total:' : 'Page Total:'}</td>
        <td>${formatCurrency(totals.p_gsis_mpl)}</td>
        <td>${formatCurrency(totals.p_ceap)}</td>
        <td>${formatCurrency(totals.p_comp)}</td>
        <td>${formatCurrency(totals.p_mpl_lite)}</td>
        <td>${formatCurrency(totals.p_pl_reg)}</td>
        <td>${formatCurrency(totals.p_gsis_el)}</td>
        <td>${formatCurrency(totals.p_gfal)}</td>
        <td>${formatCurrency(totals.p_lbp_tot)}</td>
        <td rowspan="2">${formatCurrency(totals.p_gross_gov_ded)}</td>
        <td rowspan="2">${formatCurrency(totals.p_gross_per_ded)}</td>
        <td rowspan="2">${formatCurrency(totals.p_net_pay)}</td>
        <td>${formatCurrency(totals.p_first_half)}</td>
        <td>${formatCurrency(totals.p_second_half)}</td>
    `;

    const row2 = document.createElement('tr');
    row2.className = 'expandable total-row';
    row2.innerHTML = `
        <td colspan="3">${formatCurrency(totals.p_gsis_mpl + totals.p_ceap + totals.p_comp)}</td>
        <td colspan="4">${formatCurrency(totals.p_mpl_lite + totals.p_pl_reg + totals.p_gsis_el + totals.p_gfal)}</td>
        <td>${formatCurrency(totals.p_lbp_tot)}</td>
        <td colspan="2">${formatCurrency(totals.p_first_half + totals.p_second_half)}</td>
    `;

    return [row1, row2];
}

// Update the "APPROVE FOR PAYMENT" amount based on g_total_proceeds
export function updateApproveForPaymentAmount() {
    const totalProceedsElement = document.getElementById('g_total_proceeds');
    if (!totalProceedsElement) return;
    const raw = totalProceedsElement.textContent.replace(/,/g, '') || '0';
    const totalProceeds = Number(raw) || 0;
    const approvePaymentSpan = document.querySelector('.amount');
    if (approvePaymentSpan) approvePaymentSpan.textContent = `₱${formatCurrency(totalProceeds)}`;
}
