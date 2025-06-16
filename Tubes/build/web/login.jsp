<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Log in to HotelQuo</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
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

        .login-section {
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
            margin-bottom: 20px;
        }

        label {
            display: block;
            color: rgb(75, 85, 99);
            margin-bottom: 8px;
            font-size: 15px;
        }

        .input-wrapper {
            position: relative;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-size: 15px;
            background-color: white;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #9ca3af;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #6b7280;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 16px 0 24px;
        }

        .remember-me input[type="checkbox"] {
            width: 16px;
            height: 16px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
        }

        .remember-me label {
            margin: 0;
            color: rgb(75, 85, 99);
            font-size: 14px;
        }

        .login-button {
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

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 24px 0;
            color: #6b7280;
            font-size: 14px;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #e5e7eb;
        }

        .divider span {
            padding: 0 16px;
        }

        .google-button {
            width: 100%;
            padding: 12px;
            background-color: white;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            cursor: pointer;
            font-size: 15px;
            color: #374151;
        }

        .signup-text {
            text-align: center;
            margin-top: 24px;
            color: #6b7280;
            font-size: 14px;
        }

        .signup-text a {
            color: rgb(84, 110, 97);
            text-decoration: none;
            font-weight: 500;
        }

        /* Hover states */
        .login-button:hover {
            background-color: rgb(74, 100, 87);
        }

        .google-button:hover {
            background-color: #f9fafb;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: rgb(84, 110, 97);
            box-shadow: 0 0 0 1px rgb(84, 110, 97);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-section">
            <h1>Log in to HotelQuo</h1>
            <form action="/Tubes/UserController" method="get">
                <div class="form-group">
                    <label for="username">Email Address</label>
                    <div class="input-wrapper">
                        <input type="text" id="email" name="email" placeholder="Enter a valid email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" placeholder="Enter a password" required>
                        <button type="button" class="password-toggle" onclick="togglePassword()">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M12 5c-7.333 0-12 6-12 6s4.667 6 12 6 12-6 12-6-4.667-6-12-6z"/>
                                <circle cx="12" cy="11" r="3"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- buat session 
                <div class="remember-me">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember me</label>
                </div>
                -->
                <%
                    // INI BUAT RESPONSE DARI CONTROLLER
                    String id = request.getParameter("id");
                    if ("2".equals(id)) {
                    %>
                    <h1 style="color: #DC2626; font-size: 16px; background: #FEE2E2; padding: 12px; border-radius: 6px; border: 1px solid #FCA5A5;">Password salah</h1>
                    <%
                    }else if ("3".equals(id)) { %>
                    <h1 style="color: #DC2626; font-size: 16px; background: #FEE2E2; padding: 12px; border-radius: 6px; border: 1px solid #FCA5A5;">Email salah</h1>
                    <%}else if ("4".equals(id)) {%>
                    <h1 style="color: #DC2626; font-size: 16px; background: #FEE2E2; padding: 12px; border-radius: 6px; border: 1px solid #FCA5A5;">Email sudah terdaftar, silahkan login</h1>
                    <%}
                %>
                <button type="submit" class="login-button">Login</button>
                
                <div class="divider">
                    <span>or</span>
                </div>
                
                <!-- login dengan api google
                <button type="button" class="google-button" onclick="loginWithGoogle()">
                    <svg width="18" height="18" viewBox="0 0 48 48">
                        <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"/>
                        <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"/>
                        <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"/>
                        <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"/>
                    </svg>
                    Continue with Google
                </button>
                -->
                
            </form>
            
            <p class="signup-text">
                Don't have an account? <a href="signup.jsp">Sign Up</a>
            </p>
        </div>
        <div class="image-section"></div>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
            } else {
                passwordInput.type = 'password';
            }
        }
    </script>
</body>
</html>