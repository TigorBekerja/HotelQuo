<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign up to HotelQuo</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f9fafb;
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 1440px;
            height: 100vh;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        .signup-section {
            flex: 1;
            padding: 80px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            max-width: 480px;
            margin: 0 auto;
        }

        .image-section {
            flex: 1;
            background-image: url('foto/laud.jpg');
            background-size: cover;
            background-position: center;
        }

        h1 {
            color: rgb(84, 110, 97);
            font-size: 36px;
            margin-bottom: 48px;
            font-weight: 500;
        }

        .form-group {
            margin-bottom: 24px;
        }

        label {
            display: block;
            color: rgb(75, 85, 99);
            margin-bottom: 8px;
            font-size: 15px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 14px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 15px;
            background-color: white;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: rgb(84, 110, 97);
            box-shadow: 0 0 0 1px rgb(84, 110, 97);
        }

        .signup-button {
            width: 100%;
            padding: 12px;
            background-color: rgb(84, 110, 97);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            margin-bottom: 24px;
            font-weight: 500;
        }

        .signup-button:hover {
            background-color: rgb(74, 100, 87);
        }

        .login-text {
            text-align: center;
            margin-top: 24px;
            color: #6b7280;
            font-size: 14px;
        }

        .login-text a {
            color: rgb(84, 110, 97);
            text-decoration: none;
            font-weight: 500;
        }

        .error-message {
            background-color: #fee2e2;
            border: 1px solid #ef4444;
            color: #991b1b;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 24px;
            font-size: 14px;
            text-align: center;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .password-requirements {
            margin-top: 8px;
            font-size: 12px;
            color: #6b7280;
        }

        .requirement {
            display: flex;
            align-items: center;
            gap: 4px;
            margin-bottom: 4px;
        }

        .requirement.valid {
            color: #059669;
        }

        .requirement.invalid {
            color: #dc2626;
        }

        input.invalid {
            border-color: #dc2626;
        }

        input.valid {
            border-color: #059669;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="signup-section">
            <h1>Sign up to HotelQuo</h1>
            <div id="errorMessage" class="error-message">
                This email is already registered. Redirecting to login page...
            </div>
            <form action="/Tubes/UserController" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter a valid email" required>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter a user name" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter a strong password" required>
                    <div class="password-requirements">
                        <div id="uppercase" class="requirement">Must contain uppercase letter</div>
                        <div id="number" class="requirement">Must contain number</div>
                    </div>
                </div>

                <button type="submit" class="signup-button">Sign Up</button>
            </form>
            <p class="login-text">
                Already have an account? <a href="login.jsp">Login</a>
            </p>
        </div>
        <div class="image-section"></div>
    </div>

    <script>
        const password = document.getElementById('password');
        const uppercaseElement = document.getElementById('uppercase');
        const numberElement = document.getElementById('number');

        password.addEventListener('input', validatePassword);

        function validatePassword() {
            const hasUpperCase = /[A-Z]/.test(password.value);
            const hasNumber = /[0-9]/.test(password.value);

            updateRequirement(uppercaseElement, hasUpperCase);
            updateRequirement(numberElement, hasNumber);
            
            if (hasUpperCase && hasNumber) {
                password.classList.remove('invalid');
                password.classList.add('valid');
            } else {
                password.classList.remove('valid');
                password.classList.add('invalid');
            }
        }

        function updateRequirement(element, valid) {
            element.classList.toggle('valid', valid);
            element.classList.toggle('invalid', !valid);
        }

        function validateForm() {
            const hasUpperCase = /[A-Z]/.test(password.value);
            const hasNumber = /[0-9]/.test(password.value);
            return hasUpperCase && hasNumber;
        }

        <% if (request.getAttribute("emailExists") != null) { %>
            document.getElementById('errorMessage').classList.add('show');
            setTimeout(() => {
                window.location.href = 'login.jsp';
            }, 3000);
        <% } %>
    </script>
</body>
</html>