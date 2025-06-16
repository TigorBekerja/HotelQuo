<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Hotel" %>
<%@ page import="service.HotelService" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HotelQuo</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
        }
        .search-bar {
            background: white;
            border-radius: 50px;
            padding: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.4);
            display: flex;
            margin: -25px auto 0;
            position: relative;
            z-index: 10;
            max-width: 800px;
        }

        .logo {
            color: #4b6455;
            font-size: 56px;
            font-weight: bold;
        }
        .search-item {
            padding: 12px 24px;
            border-right: 1px solid #eee;
            flex: 1;
        }
        .search-item:last-child {
            border-right: none;
        }
        .destination-card {
            position: relative;
            border-radius: 15px;
            overflow: hidden;
            height: 200px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }
        .destination-label {
            position: absolute;
            bottom: 10px;
            left: 10px;
            background: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: 500;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }
        .hotel-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
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
        font-weight: bold; 
        }


        .footer-link {
            display: block;
            color: white;
            text-decoration: none;
            margin: 5px 0;
        }
        img {
            object-fit: contain;
        }
        
       
    </style>
</head>
<%
    String id = request.getParameter("id");
    if ("0".equals(id)) {
        session = request.getSession();
        session.invalidate();
    }
%>
<section class="p-5">

    <!-- Header -->
     <header class="p-3 flex justify-between items-center">
        <a href="#" class="logo">HotelQuo</a>
        <button class="rounded-full p-1 bg-gray-300 w-12 h-12 flex items-center justify-center">
            <a href="profil.jsp">
                <img src="foto/gg_profile.png" alt="User" class="w-12 h-12 rounded-full object-contain">
            </a>
        </button>
    </header>

</section>
<section class="p-10">
    <!-- Hero Section -->
    <div class="relative">
        <img src="foto/hederkamar.png" alt="Luxury Hotel Room" class="w-full h-[700px] object-contain">
        <h2 class="absolute top-1/3 left-5 text-white text-5xl font-bold">Book your stay with HotelQuo</h2>
        
        <!-- Search Bar -->
        <form method="get" action="HotelController">
            <input type="hidden" name="method" value="location">
            <div class="search-bar">
                <div class="search-item">
                    <div class="text-sm text-gray-500">Location</div>
                    <input type="text" name="location" placeholder="Where are you going?" default=" " class="w-full border-none outline-none">
                </div>

                <button type="submit" class="bg-[#4a6670] text-white p-3 rounded-full">
                    <img src="foto/next.png" alt="Search" class="w-10 h-10">
                </button>
            </div>
        </form>
        
    </div>
</section>  
    <!-- Hotels by Guests -->
    <section class="p-10">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
    <%
        HotelService hotelservice = new HotelService();
        ArrayList<Hotel> arr_hotel = hotelservice.getAllHotels();
        int count = 0;
        int i = 0;
        for (i = 0; i < arr_hotel.size() && count!=12; i++) {
    %>
    <a href="infokamar.jsp?id=<%= arr_hotel.get(i).getId()%>">
        <div class="hotel-card">
            <img src="<%= arr_hotel.get(i).getImageUrl() %>" alt="Ashley Wahid" class="w-full h-48 object-cover">
            <div class="p-4">
                <h4 class="font-semibold"><%= arr_hotel.get(i).getName() %></h4>
                <%
                    NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("id", "ID"));
                    String formattedPrice = numberFormat.format(arr_hotel.get(i).getPrice());
                %>
                <p class="text-gray-600 text-sm mt-2 line-clamp-3"><%= arr_hotel.get(i).getDescription() %></p>
                <p class="mt-2">from <span class="text-green-600 font-semibold">Rp <%= formattedPrice %></span>/night</p>
            </div>
        </div>
    </a>
        
    <%
        count++;
        }
    %>
    </div>
    </section>
    
    <!-- Footer -->
    <footer class="footer">
        <a href="#" class="footer-logo">HotelQuo</a>
        <div class="footer-links">
            <h5 class="footer-title">Help</h5>
            <a href="#" class="footer-link">FAQ</a>
            <a href="#" class="footer-link">Customer service</a>
            <a href="#" class="footer-link">How to guide</a>
            <a href="#" class="footer-link">Contact us</a>
        </div>
    </footer>
</body>
</html>