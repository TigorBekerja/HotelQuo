<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Hotel" %>
<%@ page import="service.HotelService" %>
<%@ page import="service.RoomService" %>
<%@ page import="model.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HotelQuo - Book Hotel</title>
    <style>
        /* Previous styles remain the same */
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

        .user-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #eee;
        }

        .main-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .booking-form {
            padding-right: 2rem;
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

        .back-button {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #333;
            text-decoration: none;
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: #333;
        }

        .amenities {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .amenity {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .amenity-icon {
            width: 24px;
            height: 24px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            color: #666;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        /* New styles for date inputs */
        .date-inputs {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        /* Rest of the previous styles remain the same */
        .payment-section {
            margin-bottom: 2rem;
        }

        .payment-option {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 1rem;
            margin-bottom: 1rem;
            cursor: pointer;
        }

        .payment-icons {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            padding: 1rem;
        }

        .payment-icon {
            width: 60px;
            height: 40px;
            object-fit: contain;
        }

        .house-rules {
            margin-top: 2rem;
        }

        .rules-list {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-top: 1rem;
        }

        .rule-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .hotel-preview {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 1rem;
        }

        .hotel-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .hotel-details {
            padding: 1rem;
        }

        .hotel-name {
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
        }

        .hotel-location {
            color: #666;
            margin-bottom: 1rem;
        }

        .price-details {
            border-top: 1px solid #eee;
            margin-top: 1rem;
            padding-top: 1rem;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
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
    <!-- Header -->
    <header class="header">
    <a href="landingpage.jsp" class="logo">HotelQuo</a>
    <a href="profil.jsp">
        <button class="profile-button">
        <img src="foto/gg_profile.png" alt="User" class="profile-image">
        </button>
    </a>
    
    </header>

    <%
        HotelService hotelservice = new HotelService();
        RoomService roomservice = new RoomService();
        String id = request.getParameter("hotel_id");
        Hotel hotel = hotelservice.searchHotelByID(id);
        
        id = request.getParameter("room_id");
        Room room = roomservice.getRoomByID(id);
        session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
    %>
    <main class="main-content">
        <form method="post" action="BookingController">
            <input type="hidden" name="room_id" value="<%=request.getParameter("hotel_id")%>">
            <input type="hidden" name="price" value="<%= room.getPrice() %>">
        <!-- Booking Form -->
        <div class="booking-form">
            <a href="infokamar.jsp?id=<%=hotel.getId() %>" class="back-button">← Back</a>
            <h1 class="section-title">Book <%= hotel.getName() %> Hotel</h1>
            
            <!-- Step 1: Property Details -->
            <section>
                <h2>Step 1: Property amenities</h2>

                <div class="amenities">
                    <div class="amenity">
                        <span><%= hotel.getFacilities() %></span>
                    </div>
                </div>
                
                <!-- Modified date inputs with IDs -->
                <div class="date-inputs">
                    <div class="form-group">
                        <label class="form-label">Check-in date</label>
                        <input type="date" name="checkInDate" id="checkInDate" class="form-control" value="2024-12-09" min="2024-01-04">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Check-out date</label>
                        <input type="date" name="checkOutDate" id="checkOutDate" class="form-control" value="2024-12-12" min="2024-01-04">
                    </div>
                </div>
            </section>

            <!-- Personal data section -->
            <section>
                <h2 class="section-title">Step 2: Personal data</h2>
                <div class="form-group">
                    <label class="form-label">First and Last name</label>
                    <input type="text" class="form-control" value="<%= user.getFull_name() %>" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label">Email address</label>
                    <input type="email" class="form-control" value="<%= user.getEmail()%>" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label">Phone number</label>
                    <input type="tel" class="form-control" value="<%= user.getPhone_number()%>" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label">Nationality</label>
                    <input type="text" class="form-control" value="<%= user.getCountry()%>" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label">Date of birth</label>
                    <input type="text" class="form-control" value="<%= user.getDOB()%>" readonly>
                </div>
            </section>
                <button type="submit" class="book-button">Submit</button>
            <!-- Rest of your existing sections -->
        </div>
        </form>
        <!-- Hotel Preview -->
        <div class="hotel-preview">
            <img src="foto/yogya.png" alt="<%= hotel.getName() %>" class="hotel-image">
            <div class="hotel-details">
                <h2 class="hotel-name"><%= hotel.getName() %> Hotel</h2>
                <p class="hotel-location"><%= hotel.getDescription() %></p>
                
                <div class="booking-dates">
                    <p><strong>Check-in:</strong> <span id="displayCheckIn">Friday, 09 December 2024</span></p>
                    <p><strong>Check-out:</strong> <span id="displayCheckOut">Monday, 12 December 2024</span></p>
                    <p><strong>Duration:</strong> <span id="nightsCount">3</span> nights</p>
                </div>

                <div class="price-details">
                    <div class="price-row">
                        <span>Price per night</span>
                        <%
                            NumberFormat numberFormat = NumberFormat.getNumberInstance(new Locale("id", "ID"));
                            String formattedPrice = numberFormat.format(room.getPrice());
                        %>
                        <span>Rp <%= formattedPrice %></span>
                    </div>
                    <div class="price-row">
                        <span><span id="totalNights">3</span> nights</span>
                        <span id="subtotal">Rp 8.372.679</span>
                    </div>
                    <div class="price-row">
                        <span>PPN (12%)</span>
                        <span id="ppn">Rp 100.000</span>
                    </div>
                    <div class="price-row">
                        <strong>Total</strong>
                        <strong id="totalPrice">Rp 8.522.679</strong>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <% }else{ %>
        <div class="welcome-container">
            <h1>Welcome to HotelQuo</h1>
            <p>Please login or register to continue</p>
            <div class="button-container">
                <a href="login.jsp" class="button login-button">Login</a>
                <a href="signup.jsp" class="button signup-button">Register</a>
            </div>
        </div>
    <% } %>
    <!-- Footer -->
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
    
    <script>
        // Store the price per night from JSP
        const pricePerNight = <%= room.getPrice() %>;

        // Function to format currency in Indonesian Rupiah
        function formatRupiah(number) {
            return 'Rp ' + number.toLocaleString('id-ID');
        }

        // Function to calculate number of nights between two dates
        function calculateNights(checkIn, checkOut) {
            const oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
            const diffDays = Math.round(Math.abs((checkOut - checkIn) / oneDay));
            return diffDays;
        }

        // Function to calculate total price
        function calculatePrices(nights) {
            const subtotal = pricePerNight * nights;
            const ppn = subtotal * 0.12; // 12% PPN
            const total = subtotal + ppn;
            
            return {
                subtotal: subtotal,
                ppn: ppn,
                total: total
            };
        }

        // Function to format date as "Day, DD Month YYYY"
        function formatDate(date) {
            const options = { weekday: 'long', day: '2-digit', month: 'long', year: 'numeric' };
            return date.toLocaleDateString('en-US', options);
        }

        // Function to update all displayed information
        function updateDisplay() {
            const checkInInput = document.getElementById('checkInDate');
            const checkOutInput = document.getElementById('checkOutDate');
            
            const checkInDate = new Date(checkInInput.value);
            const checkOutDate = new Date(checkOutInput.value);

            // Update displayed dates
            document.getElementById('displayCheckIn').textContent = formatDate(checkInDate);
            document.getElementById('displayCheckOut').textContent = formatDate(checkOutDate);

            // Calculate and update nights
            const nights = calculateNights(checkInDate, checkOutDate);
            document.getElementById('nightsCount').textContent = nights;
            document.getElementById('totalNights').textContent = nights;

            // Calculate and update prices
            const prices = calculatePrices(nights);
            document.getElementById('subtotal').textContent = formatRupiah(prices.subtotal);
            document.getElementById('ppn').textContent = formatRupiah(prices.ppn);
            document.getElementById('totalPrice').textContent = formatRupiah(prices.total);
        }

        // Function to validate dates
        function validateDates() {
            const checkInInput = document.getElementById('checkInDate');
            const checkOutInput = document.getElementById('checkOutDate');
            
            const checkInDate = new Date(checkInInput.value);
            const checkOutDate = new Date(checkOutInput.value);

            if (checkOutDate <= checkInDate) {
                const newCheckOutDate = new Date(checkInDate);
                newCheckOutDate.setDate(newCheckOutDate.getDate() + 1);
                checkOutInput.value = newCheckOutDate.toISOString().split('T')[0];
            }
            
            updateDisplay();
        }

        // Add event listeners to date inputs
        document.getElementById('checkInDate').addEventListener('change', validateDates);
        document.getElementById('checkOutDate').addEventListener('change', validateDates);

        // Initialize display on page load
        updateDisplay();
    </script>
</body>
</html>