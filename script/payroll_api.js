// payroll_api.js
export async function fetchPayrollData() {
    try {
        const response = await fetch('../php/get_payroll_data.php');
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return await response.json();
    } catch (error) {
        console.error('Fetch error:', error);
        return { success: false, message: 'Failed to fetch data from server. Error: ' + (error.message || error) };
    }
}
