<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="css/forgot_password.css">
</head>
<body>
    <div id="container" class="container">
        <div class="form-container">
            <h2>Forgot Password</h2>
            <p>Enter your email to receive an OTP</p>
            <div class="input-group">
                <i class='bx bxs-envelope'></i>
                <input type="email" id="email" placeholder="Email Address">
            </div>
            <button onclick="sendOTP()">Send OTP</button>
        </div>

        <!-- OTP Verification Form (Hidden initially) -->
        <div class="form-container" id="otp-section" style="display: none;">
            <h2>Enter OTP</h2>
            <p>We have sent an OTP to your email</p>
            <div class="input-group">
                <i class='bx bxs-lock'></i>
                <input type="text" id="otp" placeholder="Enter OTP">
            </div>
            <button onclick="verifyOTP()">Verify OTP</button>
        </div>

        <!-- Password Reset Form (Hidden initially) -->
        <div class="form-container" id="password-reset-section" style="display: none;">
            <h2>Reset Password</h2>
            <div class="input-group">
                <i class='bx bxs-lock-alt'></i>
                <input type="password" id="new-password" placeholder="New Password">
            </div>
            <div class="input-group">
                <i class='bx bxs-lock-alt'></i>
                <input type="password" id="confirm-password" placeholder="Confirm Password">
            </div>
            <button onclick="resetPassword()">Submit</button>
        </div>

        <!-- Success Message -->
        <div class="form-container" id="success-message" style="display: none;">
            <h2>Password Changed Successfully</h2>
            <p>You can now log in with your new password.</p>
            <button onclick="goToLogin()">Go to Login</button>
        </div>
    </div>

    <script src="js/forgor_password.js"></script>
</body>
</html>
