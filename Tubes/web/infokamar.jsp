<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Hotel" %>
<%@ page import="service.HotelService" %>
<%@ page import="service.RoomService" %>
<%@ page import="model.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HotelQuo - Jambuluwuk Malioboro Hotel</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
        }

        body {
            background-color: #f5f7f7;
        }

        .header {
            background: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between; 
            align-items: center;
            border-bottom: 1px solid #e1e1e1;
        }

        .logo {
            color: #4b6455;
            font-size: 56px;
            font-weight: bold;
            text-decoration: none;
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

        .profile-image {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: contain;
        }

        .image-gallery {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            grid-template-rows: 200px 200px;
            gap: 10px;
            padding: 20px;
            background: white;
        }

        .gallery-main {
            grid-row: span 2;
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 8px;
        }

        .hotel-info {
            background: white;
            padding: 20px;
            margin-bottom: 10px;
        }

        .hotel-name {
            font-size: 20px;
            margin-bottom: 5px;
        }

        .hotel-location {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        
        .hotel-description {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .rating {
            display: inline-flex;
            align-items: center;
            background-color: #ebf9f1;
            color: #00aa6c;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
        }

        .rating img {
            height: 16px;
            margin-right: 4px;
        }

        .tabs {
            display: flex;
            background: white;
            padding: 0 20px;
            margin-bottom: 10px;
        }

        .tab {
            padding: 15px 20px;
            color: #666;
            cursor: pointer;
            font-size: 14px;
            border-bottom: 2px solid transparent;
        }

        .tab.active {
            color: #4b6455;
            border-bottom: 2px solid #4b6455;
        }

        .amenities {
            background: white;
            padding: 20px;
            margin-bottom: 10px;
        }

        .property-overview {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .amenity {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
        }

        .amenity span:first-child {
            font-size: 20px;
        }

        .rooms-section {
            padding: 20px;
        }

        .rooms-title {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .rooms-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 15px;
        }

        .room-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        .room-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .room-info {
            padding: 15px;
        }

        .room-name {
            font-weight: 600;
            margin-bottom: 8px;
        }

        .room-details {
            font-size: 14px;
            color: #666;
            margin-bottom: 12px;
        }

        .room-price {
            font-size: 14px;
            color: #333;
            margin-bottom: 10px;
        }

        .book-button {
            background-color: #4b6455;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            width: 100%;
            font-size: 14px;
            cursor: pointer;
        }

        .reviews {
            background: white;
            padding: 20px;
            margin-top: 10px;
        }

        .review-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .review-score {
            font-size: 24px;
            font-weight: bold;
            color: #4b6455;
            margin-right: 10px;
        }

        .review-summary {
            color: #666;
            font-size: 14px;
        }

        .footer {
            background-color: #4b6455;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
        }

        .footer-logo {
            color: white;
            font-size: 56px;
            font-weight: bold;
            text-decoration: none;
        }

        .footer-links {
            text-align: right;
        }

        .footer-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .footer-link {
            display: block;
            color: white;
            text-decoration: none;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <header class="header">
    <a href="landingpage.jsp" class="logo">HotelQuo</a>
    <button class="profile-button">
        <a href="profil.jsp"><img src="foto/gg_profile.png" alt="User" class="profile-image"></a>
    </button>
    </header>
    
    <%
        HotelService hotelservice = new HotelService();
        String id = request.getParameter("id");
        Hotel hotel = hotelservice.searchHotelByID(id);
        
    %>
    <div class="image-gallery">
        <div class="gallery-item gallery-main">
            <img src="<%= hotel.getImageUrl()%>" alt="Hotel Front">
        </div>
    </div>

    <div class="hotel-info">
        <h1 class="hotel-name"><%= hotel.getName()%></h1>
        <p class="hotel-location font-semibold"><%= hotel.getLocation()%></p>
        <p class="hotel-description"><%= hotel.getDescription()%></p>
        <div class="rating">
            <%
                            float rating = hotel.getRating();
                            if (rating >= 5) { %>
                                ★★★★★
                            <%} else if (rating > 4) { %>
                                ★★★★
                            <%} else if (rating > 3) { %>
                                ★★★
                            <%} else if (rating > 2) { %>
                                ★★
                            <%} else if (rating > 1) { %>
                                ★
                            <%}else{ %>

                            <%}
                        %>
                        <%= hotel.getRating() %>
        </div>
    </div>

    <div class="tabs">
        <div class="tab active">Overview</div>
        <div class="tab">Rooms</div>
        <div class="tab">Amenities</div>
        <div class="tab">Location</div>
    </div>

    <div class="amenities">
        <h2 class="section-title">Property overview</h2>
        <div class="property-overview">
            <div class="amenity">
                <span><%= hotel.getFacilities()%></span>
            </div>
        </div>
    </div>

    <div class="rooms-section">
        <h2 class="rooms-title">Rooms</h2>
        <div class="rooms-grid">
            <%
                RoomService roomservice = new RoomService();
                ArrayList<Room> arr_room = new ArrayList<>();
                
                arr_room = roomservice.getAllRoom(hotel.getId());
                
                if (arr_room.size() == 0) {
            %>
            <h1> tidak ada kamar yang tersedia</h1>
            <%} else { 
                    for (Room room : arr_room) { %>
            <div class="room-card">
                <img src="<%= room.getImage_url() %>" alt="Double Standard Room" class="room-image">
                <div class="room-info">
                    <div class="room-name"><%= room.getType() %></div>
                    <div class="room-details text-sm mt-2 line-clamp-3">
                        <%= room.getDescription() %>
                    </div>
                    <!-- BELUM SELESAI, BUAT CONTROLLER DULU -->
                    <a href="boking.jsp?room_id=<%=room.getRoom_id()%>&hotel_id=<%=hotel.getId() %>">
                        <%
                            NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("id", "ID"));
                            String formattedPrice = numberFormat.format(room.getPrice());
                        %>
                        <button  class="book-button">Book now for Rp <%= formattedPrice %></button>
                    </a>
                    
                </div>
            </div>
                <%}%>
            <!-- Additional room cards would be generated here -->
            <%}%>
        </div>
    </div>
    
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