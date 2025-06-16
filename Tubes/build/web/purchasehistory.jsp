<!-- purchaseHistory.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Booking" %>
<%@ page import="service.HotelService" %>
<%@ page import="service.RoomService" %>
<%@ page import="model.Hotel" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Purchase History - HotelQuo</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            width: 100%;
        }

        /* Header Styles */
        .header {
            background: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between; 
            align-items: center;
            border-bottom: 1px solid #e1e1e1;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: #4b6455;
            font-size: 56px;
            font-weight: bold;
            text-decoration: none;
        }
        .profile-image {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: contain;
        }
        .profile-button {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: #d1d5db;
            border: none;
            padding: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .profile-icon {
            width: 40px;
            height: 40px;
            background-color: #446b59;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            background-color: #f5f5f5;
            padding: 20px 0;
        }

        .back-button {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #446b59;
            text-decoration: none;
            margin-bottom: 20px;
        }

        .page-title {
            font-size: 24px;
            margin-bottom: 30px;
            color: #333;
        }

        .booking-card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background: white;
        }

        .hotel-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        .hotel-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .hotel-location {
            color: #666;
            margin-bottom: 15px;
        }

        .booking-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-bottom: 15px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            color: #666;
            font-size: 14px;
        }

        .detail-value {
            font-weight: bold;
        }

        .price {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 15px;
            border-top: 1px solid #e0e0e0;
        }

        .price-label {
            color: #666;
        }

        .price-value {
            font-size: 18px;
            font-weight: bold;
            color: #446b59;
        }

        .status-paid {
            background: #e8f5e9;
            color: #2e7d32;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            margin-left: 10px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-outline {
            background-color: white;
            color: #007bff;
            border: 1px solid #007bff;
        }

        /* Footer Styles */
        .footer {
            background-color: #446b59;
            color: white;
            padding: 40px 0;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .footer-logo {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .help-section {
            text-align: right;
        }

        .help-section h3 {
            margin-bottom: 15px;
            font-size: 18px;
        }

        .help-links {
            list-style: none;
        }

        .help-links li {
            margin-bottom: 10px;
        }

        .help-links a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <a href="landingpage.jsp" class="logo">HotelQuo</a>
        <button class="profile-button">
            <a href="profil.jsp"><img src="foto/gg_profile.png" alt="User" class="profile-image"></a>
        </button>
    </header>
    
    
    
    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <a href="profil.jsp" class="back-button">
                <span>←</span>
                <span>Back</span>
            </a>

            <h1 class="page-title">Purchase History</h1>
            <%
                ArrayList<Booking> arr_booking = (ArrayList<Booking>) request.getAttribute("arr_booking");
                if (arr_booking == null || arr_booking.size() == 0) { %>
                <h1> kosong</h1>
                <%}else{
                    for (Booking booking : arr_booking) {
                    HotelService hotelservice = new HotelService();
                    RoomService roomservice = new RoomService();
                    Hotel hotel = hotelservice.searchHotelByID(roomservice.getRoomByID(booking.getRoom_id()).getHotel_id());
            %>
            
            
            <div class="booking-card">
                <img src="<%= hotel.getImageUrl() %>" alt="Jambuluwuk Malioboro Hotel" class="hotel-image">
                <h2 class="hotel-name"><%= hotel.getName() %></h2>
                <p class="hotel-location"><%= hotel.getLocation() %></p>
                
                <div class="booking-details">
                    <div class="detail-item">
                        <span class="detail-label">Check-in</span>
                        <span class="detail-value">from <%= booking.getCheck_in() %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Check-out</span>
                        <span class="detail-value">until <%= booking.getCheck_out() %></span>
                    </div>
                </div>

                <div class="price">
                    <span class="price-label">Total Price</span>
                    <div>
                        <%
                            NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("id", "ID"));
                            String formattedPrice = numberFormat.format(booking.getPrice());
                        %>
                        <span class="price-value">Rp <%= formattedPrice %></span>

                        <span class="status-paid">paid</span>
                    </div>
                </div>
                <form action="BookingController" method="post">
                    <input type="hidden" name="method" value="del">
                    <input type="hidden" name="booking_id" value=<%= booking.getBooking_id() %>>
                    <div class="button-group">
                        <button type="submit" class="btn btn-outline">Cancel reservation</button>
                    </div>
                </form>        
                
            </div>
        
            <%}
            }
                %>
                </div>
    </main>
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <a href="#" class="footer-logo">HotelQuo</a>
                <div class="help-section">
                    <h3>Help</h3>
                    <ul class="help-links">
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Customer service</a></li>
                        <li><a href="#">How to guide</a></li>
                        <li><a href="#">Contact us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>