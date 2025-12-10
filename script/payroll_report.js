// Entry module: minimal orchestration that loads modules
import { fetchPayrollData } from './payroll_api.js';
import { populatePayrollData, setupDownloadButton } from './payroll_renderer.js';

document.addEventListener('DOMContentLoaded', async () => {
    try {
        const data = await fetchPayrollData();
        if (data && data.success) {
            populatePayrollData(data);
        } else {
            // Show an inline error 
            const message = data && data.message ? data.message : 'Failed to load payroll data';
            const errDiv = document.createElement('div');
            errDiv.className = 'alert alert-danger';
            errDiv.textContent = message;
            document.body.insertBefore(errDiv, document.body.firstChild);
            console.error('Server response:', data);
        }
    } catch (err) {
        console.error('Error loading payroll data:', err);
        const errDiv = document.createElement('div');
        errDiv.className = 'alert alert-danger';
        errDiv.textContent = 'An error occurred while loading payroll data. Check console for details.';
        document.body.insertBefore(errDiv, document.body.firstChild);
    }

    // Bind download button (may be rebounded by renderer after DOM rebuilds)
    setupDownloadButton();
});