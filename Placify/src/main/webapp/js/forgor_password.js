function sendOTP() {
    const email = document.getElementById('email').value;
    if (email) {
        alert(`OTP sent to ${email}`);
        document.querySelector('.form-container').style.display = 'none';
        document.getElementById('otp-section').style.display = 'block';
    } else {
        alert('Please enter your email address');
    }
}

function verifyOTP() {
    const otp = document.getElementById('otp').value;
    if (otp === '123456') { // Simulate correct OTP
        document.getElementById('otp-section').style.display = 'none';
        document.getElementById('password-reset-section').style.display = 'block';
    } else {
        alert('Invalid OTP. Please try again.');
    }
}

function resetPassword() {
    const newPassword = document.getElementById('new-password').value;
    const confirmPassword = document.getElementById('confirm-password').value;
    if (newPassword && confirmPassword && newPassword === confirmPassword) {
        alert('Password reset successfully');
        document.getElementById('password-reset-section').style.display = 'none';
        document.getElementById('success-message').style.display = 'block';
    } else {
        alert('Passwords do not match. Please try again.');
    }
}

function goToLogin() {
    window.location.href = 'admin_login.html'; // Redirect to login page
}
