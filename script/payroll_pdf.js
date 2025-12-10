// payroll_pdf.js
import { formatCurrency } from './payroll_utils.js';

export async function generatePDF() {
    const element = document.getElementById('pdf-content');
    const downloadButton = document.getElementById('download-pdf');

    if (downloadButton) downloadButton.style.display = 'none';

    const payrollNumberEl = document.getElementById('payrollNo');
    const payrollNumber = payrollNumberEl ? payrollNumberEl.textContent.trim() : 'unknown';
    const filename = `payroll_${payrollNumber || 'unknown'}.pdf`;

    const options = {
        margin: [0.10, 0.10, 0.10, 0.10],
        filename: filename,
        image: { type: 'png', quality: 1.0 },
        html2canvas: { scale: 2, useCORS: true, backgroundColor: '#ffffff', scrollY: 0 },
        pagebreak: { mode: ['css', 'legacy'] },
        jsPDF: { unit: 'in', format: [8.5, 13], orientation: 'landscape', compress: true }
    };

    try {
        await html2pdf().from(element).set(options).save();
    } catch (err) {
        console.error('PDF generation error:', err);
    } finally {
        if (downloadButton) downloadButton.style.display = 'block';
    }
}
