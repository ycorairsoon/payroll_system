// payroll_utils.js
export function formatCurrency(value) {
    if (value === null || value === undefined || value === '') return '0.00';
    const num = Number(value) || 0;
    return num.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

export function formatDate(dateString) {
    if (!dateString) return 'N/A';
    try {
        const date = new Date(dateString);
        return date.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
    } catch (e) {
        console.error('Date formatting error:', e);
        return dateString;
    }
}
