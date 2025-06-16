<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Hotel" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HotelQuo</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
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

        .container {
            display: flex;
            min-height: calc(100vh - 140px);
        }

        .sidebar {
            width: 300px;
            padding: 20px;
            border-right: 1px solid #eee;
        }

        .main-content {
            flex: 1;
            padding: 20px;
        }

        .search-form input, .search-form select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }

        .search-button {
            width: 100%;
            padding: 12px;
            background-color: #4b6455;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }

        .filters-section {
            margin-top: 30px;
        }

        .filter-group {
            margin-bottom: 20px;
        }

        .filter-title {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin: 8px 0;
        }

        .checkbox-group input {
            margin-right: 8px;
        }

        .hotel-card {
            display: flex;
            border: 1px solid #eee;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .hotel-image {
            width: 200px;
            height: 150px;
            object-fit: cover;
            border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }

        .hotel-info {
            flex: 1;
            padding: 0 20px;
        }

        .hotel-name {
            color: #4b6455;
            font-size: 18px;
            margin-bottom: 8px;
        }

        .hotel-location {
            color: #666;
            font-size: 14px;
        }

        .hotel-price {
            text-align: right;
        }

        .price-amount {
            color: #4b6455;
            font-size: 20px;
            font-weight: bold;
        }

        .see-rooms-btn {
            background-color: #4b6455;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }

        .star-rating {
            color: #ffd700;
        }
        .not-found-container {
                text-align: center;
                padding: 60px 20px;
                background: linear-gradient(to bottom right, #ffffff, #f8f9fa);
                border-radius: 16px;
                margin: 40px auto;
                max-width: 600px;
                box-shadow: 0 8px 24px rgba(75, 100, 85, 0.15);
                border: 1px solid rgba(75, 100, 85, 0.1);
            }

            .not-found-icon {
                font-size: 64px;
                color: #4b6455;
                margin-bottom: 24px;
                animation: bounce 2s infinite;
            }

            .not-found-heading {
                color: #4b6455;
                font-size: 2.5rem;
                margin-bottom: 16px;
                font-weight: 600;
                animation: fadeIn 0.8s ease-in-out;
            }

            .not-found-subtext {
                color: #666;
                font-size: 1.1rem;
                margin-bottom: 32px;
                line-height: 1.5;
            }

            .not-found-button {
                background-color: #4b6455;
                color: white;
                padding: 12px 28px;
                border: none;
                border-radius: 8px;
                font-size: 1.1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(75, 100, 85, 0.2);
            }

            .not-found-button:hover {
                background-color: #3a4f42;
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(75, 100, 85, 0.3);
            }

            @keyframes bounce {
                0%, 100% { transform: translateY(0); }
                50% { transform: translateY(-15px); }
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
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
    <a href="profil.jsp">
        <button class="profile-button">
        <img src="foto/gg_profile.png" alt="User" class="profile-image">
        </button>
    </a>
    </header>

    <div class="container">
        <div class="sidebar">
            <form method="get" action="HotelController" class="search-form">
                <div>
                    <label>Destination</label>
                    <input type="hidden" name="method" value="location">
                    <input type="text" name="location" placeholder="Where are you going?" default=" "/>
                </div>
                <button type="submit" class="search-button">Search</button>
            </form>
        </div>
        <%
        ArrayList<Hotel> arrs_hotel = (ArrayList<Hotel>) request.getAttribute("arr_hotel");
        if (arrs_hotel.size() == 0) { %>
        <div class="not-found-container">
            <h1 class="not-found-heading">Hotel tidak ditemukan</h1>
            <p class="not-found-subtext">Maaf, kami tidak dapat menemukan hotel yang sesuai dengan kriteria pencarian Anda. Silakan coba dengan filter atau lokasi yang berbeda.</p>
        </div>
        <% }else{ %>
        <div class="main-content">
            <h2><%=arrs_hotel.size() %> search result for <%= arrs_hotel.getFirst().getLocation()%></h2>
            
            <% for (Hotel hotel : arrs_hotel) { %>
            <div class="hotel-card">
                <img src="<%= hotel.getImageUrl() %>" class="hotel-image" alt="Hotel" />
                <div class="hotel-info">
                    <h3 class="hotel-name"><%= hotel.getName()%></h3>
                    <div class="hotel-location"><%= hotel.getLocation()%></div>
                    <div class="star-rating">
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
                    <p><%= hotel.getDescription()%></p>
                </div>
                <div class="hotel-price">
                    <%
                        NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("id", "ID"));
                        String formattedPrice = numberFormat.format(hotel.getPrice());
                    %>
                    <div class="price-amount">Rp <%=formattedPrice %></div>
                    <p>Per night</p>
                    <a href="infokamar.jsp?id=<%= hotel.getId()%>">
                        <button class="see-rooms-btn">See available rooms</button>
                    </a>
                </div>
            </div>
            <% } %>
        </div>
    <% } %>
    </div>
    <footer class="footer">
        <a href="#" class="footer-logo">HotelQuo</a>
        <div class="footer-links">
            <h3 class="footer-title">Help</h3>
            <a href="#" class="footer-link">FAQ</a>
            <a href="#" class="footer-link">Customer service</a>
            <a href="#" class="footer-link">How to guide</a>
            <a href="#" class="footer-link">Contact us</a>
        </div>
    </footer>
</body>
</html>