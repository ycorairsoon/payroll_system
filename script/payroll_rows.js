// payroll_rows.js
import { formatCurrency } from './payroll_utils.js';

export function createEmployeeRowFirstTable(employee, rowNum) {
    const row = document.createElement('tr');
    row.className = 'expandable entry-row';
    row.style.fontWeight = 'normal';

    row.innerHTML = `
        <td>${rowNum}</td>
        <td>${employee.emp_name || ''}</td>
        <td>${employee.emp_position || employee.PositionTitle || ''}</td>
        <td>${employee.emp_no || employee.EmpNo || ''}</td>
        <td>${formatCurrency(employee.Salary)}</td>
        <td>${formatCurrency(employee.PERA)}</td>
        <td>${formatCurrency(employee.GrossIncome)}</td>
        <td>${formatCurrency(employee.Tardiness)}</td>
        <td>${formatCurrency(employee.IncomeTaxWithHeld)}</td>
        <td>${formatCurrency(employee.PHIC_EmployeeShare)}</td>
        <td>${formatCurrency(employee.PHIC_EmployerShare)}</td>
        <td>${formatCurrency(employee.PAGIBIG_EmployeeShare)}</td>
        <td>${formatCurrency(employee.PAGIBIG_EmployerShare)}</td>
        <td>${formatCurrency(employee.PAGIBIG_II)}</td>
        <td>${formatCurrency(employee.GSIS_EmployeeShare)}</td>
        <td>${formatCurrency(employee.GSIS_EmployerShare)}</td>
        <td>${formatCurrency(employee.GSIS_ECC)}</td>
        <td>${formatCurrency(employee.PAGIBIG_MPL)}</td>
        <td>${formatCurrency(employee.PAGIBIG_Housing)}</td>
        <td>${formatCurrency(employee.PAGIBIG_LotPurchase)}</td>
        <td>${formatCurrency(employee.GSCGEA_Dues)}</td>
        <td>${formatCurrency(employee.GSCGEA_OtherDues)}</td>
        <td>${formatCurrency(employee.GSCCoop)}</td>
    `;

    return row;
}

export function createEmployeeRowSecondTable(employee, rowNum) {
    const row = document.createElement('tr');
    row.className = 'expandable entry-row';
    row.style.fontWeight = 'normal';

    row.innerHTML = `
        <td>${rowNum}</td>
        <td>${employee.emp_name || ''}</td>
        <td>${employee.emp_position || employee.PositionTitle || ''}</td>
        <td>${employee.emp_no || employee.EmpNo || ''}</td>
        <td>${formatCurrency(employee.GSIS_MPL)}</td>
        <td>${formatCurrency(employee.ceap)}</td>
        <td>${formatCurrency(employee.GSIS_ComputerLoan)}</td>
        <td>${formatCurrency(employee.GSIS_MPLLite)}</td>
        <td>${formatCurrency(employee.GSIS_PolicyLoanRegular)}</td>
        <td>${formatCurrency(employee.GSIS_EmergencyLoan)}</td>
        <td>${formatCurrency(employee.GSIS_GFAL)}</td>
        <td>${formatCurrency(employee.BankLoan_LBP)}</td>
        <td>${formatCurrency(employee.GrossDeductionGovernment)}</td>
        <td>${formatCurrency(employee.GrossDeductionPersonal)}</td>
        <td>${formatCurrency(employee.NetPay)}</td>
        <td>${formatCurrency(employee.NetPay1stHalf)}</td>
        <td>${formatCurrency(employee.NetPay2ndHalf)}</td>
    `;

    return row;
}
