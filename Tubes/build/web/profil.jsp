<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HotelQuo - Profile Settings</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
        }

        /* Layout */
        .container {
            display: flex;
            min-height: calc(100vh - 120px);
            background-color: #ffffff;
        }

        /* Header Styles */
        .header {
            background: white;
            padding: 1rem 1.25rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e1e1e1;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .logo {
            color: #4b6455;
            font-size: 2.5rem;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .logo:hover {
            color: #3a4f42;
        }

        /* Profile Button Styles */
        .profile-button {
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            background-color: #d1d5db;
            border: none;
            padding: 0.25rem;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .profile-button:hover {
            transform: scale(1.05);
        }

        .profile-image {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: contain;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            padding: 1.5rem;
            border-right: 1px solid #e1e1e1;
            background-color: #f8f9fa;
        }

        .back-button {
            display: flex;
            align-items: center;
            margin-bottom: 1.25rem;
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .back-button:hover {
            color: #1a73e8;
        }

        .nav-title {
            font-size: 1.25rem;
            margin-bottom: 1.25rem;
            color: #2d3748;
        }

        .nav-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 0;
            color: #4a5568;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .nav-item i {
            margin-right: 0.75rem;
            font-size: 1.25rem;
        }

        .nav-item:hover {
            color: #1a73e8;
            padding-left: 0.5rem;
        }

        .nav-item.active {
            color: #1a73e8;
            font-weight: 500;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 2rem 2.5rem;
            background-color: #ffffff;
        }

        .section-title {
            font-size: 1.5rem;
            margin-bottom: 0.625rem;
            color: #2d3748;
        }

        .section-subtitle {
            color: #666;
            margin-bottom: 2rem;
            font-size: 1rem;
        }

        /* Form Styles */
        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid #e1e1e1;
        }

        .form-label {
            font-weight: 500;
            width: 150px;
            color: #2d3748;
        }

        .form-value {
            color: #4a5568;
            flex: 1;
        }

        .edit-link {
            display: inline-block;
            margin-top: 1.5rem;
            color: #1a73e8;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .edit-link:hover {
            color: #1557b0;
            text-decoration: underline;
        }

        /* Welcome Container Styles */
        .welcome-container {
            text-align: center;
            background: white;
            padding: 2.5rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 2rem auto;
        }

        .button-container {
            display: flex;
            gap: 1.25rem;
            justify-content: center;
            margin-top: 1.5rem;
        }

        .button {
            padding: 0.625rem 1.25rem;
            font-size: 1rem;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
            text-decoration: none;
            color: white;
            transition: all 0.2s ease;
        }

        .login-button {
            background-color: #1a73e8;
        }

        .signup-button {
            background-color: #34a853;
        }

        .button:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Footer Styles */
        .footer {
            background-color: #4b6455;
            color: white;
            padding: 1.25rem 2.5rem;
            display: flex;
            justify-content: space-between;
        }

        .footer-logo {
            color: white;
            font-size: 2.5rem;
            font-weight: bold;
            text-decoration: none;
        }

        .footer-links {
            text-align: right;
        }

        .footer-title {
            font-size: 1.125rem;
            margin-bottom: 0.625rem;
            color: #ffffff;
        }

        .footer-link {
            display: block;
            color: #ffffff;
            text-decoration: none;
            margin: 0.3125rem 0;
            transition: opacity 0.2s ease;
        }

        .footer-link:hover {
            opacity: 0.8;
        }

        /* Logout Button */
        .logout-button {
            margin-top: auto;
            padding: 0.75rem 0;
            color: #dc3545;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <header class="header">
        <a href="landingpage.jsp" class="logo">HotelQuo</a>
        <button class="profile-button">
            <img src="foto/gg_profile.png" alt="User" class="profile-image">
        </button>
    </header>

    <%
        session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
    %>
        <div class="welcome-container">
            <h1>Welcome to HotelQuo</h1>
            <p>Please login or register to continue</p>
            <div class="button-container">
                <a href="login.jsp" class="button login-button">Login</a>
                <a href="signup.jsp" class="button signup-button">Register</a>
            </div>
        </div>
    <% 
        } else { 
    %>
        <div class="container">
            <aside class="sidebar">
                <a href="landingpage.jsp" class="back-button">← Back</a>
                <h2 class="nav-title">Profile settings</h2>
                <nav>
                    <a href="profil.jsp" class="nav-item active">
                        <i>👤</i> Personal details
                    </a>
                    <a href="BookingController" method="get" class="nav-item" >
                        <i>💳</i> Payment information
                    </a>
                    <a href="#" class="nav-item">
                        <i>🛡️</i> Safety
                    </a>
                    <a href="#" class="nav-item">
                        <i>⚙️</i> Preferences
                    </a>
                    <a href="#" class="nav-item">
                        <i>🔔</i> Notifications
                    </a>
                </nav>
                <a href="landingpage.jsp?id=0" class="nav-item logout-button">
                    <i>↪️</i> Log out
                </a>
            </aside>

            <main class="main-content">
            <h1 class="section-title">Personal details</h1>
            <p class="section-subtitle">Edit your personal details</p>

            <div class="form-group">
                <span class="form-label">Full name</span>
                <span class="form-value"><%= user.getFull_name() %></span>
            </div>

            <div class="form-group">
                <span class="form-label">Username</span>
                <span class="form-value"><%= user.getUsername() %></span>
            </div>

            <div class="form-group">
                <span class="form-label">Email</span>
                <span class="form-value"><%= user.getEmail() %></span>
            </div>
            
            <div class="form-group">
                <span class="form-label">Country</span>
                <span class="form-value"><%= user.getCountry() %></span>
            </div>
            
            <div class="form-group">
                <span class="form-label">Phone</span>
                <span class="form-value"><%= user.getPhone_number()%></span>
            </div>
            
            <div class="form-group">
                <span class="form-label">Date of Birth</span>
                <span class="form-value"><%= user.getDOB() %></span>
            </div>

            <a href="editprofil.jsp" class="edit-link">Edit Profile</a>
        </main>
        </div>
    <% 
        }
    %>

    <footer class="footer">
        <a href="#" class="footer-logo">HotelQuo</a>
        <div class="footer-links">
            <h2 class="footer-title">Help</h2>
            <a href="#" class="footer-link">FAQ</a>
            <a href="#" class="footer-link">Customer service</a>
            <a href="#" class="footer-link">How to guide</a>
            <a href="#" class="footer-link">Contact us</a>
        </div>
    </footer>
</body>
</html>