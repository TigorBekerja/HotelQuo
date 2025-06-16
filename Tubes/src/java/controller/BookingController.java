/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Booking;
import service.BookingService;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import model.User;
import java.util.ArrayList;
import service.UserService;
/**
 *
 * @author vandi
 */
@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
public class BookingController extends HttpServlet {
    BookingService bookingservice = new BookingService();
    UserService userservice = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("profil.jsp");
        }else{
            ArrayList<Booking> arr_booking = new ArrayList<>();
            arr_booking = bookingservice.getAllBooking(userservice.getUserID(user.getEmail()));
            request.setAttribute("arr_booking", arr_booking);
            RequestDispatcher rd = request.getRequestDispatcher("purchasehistory.jsp");
            rd.forward(request, response);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("profil.jsp");
        }else{
            String method = request.getParameter("method");
            if ("del".equalsIgnoreCase(method)) {
                doDel(request, response);
            }else{
                String user_id = userservice.getUserID(user.getEmail());
                String room_id = request.getParameter("room_id");
                Date checkin = Date.valueOf(request.getParameter("checkInDate"));
                Date checkout = Date.valueOf(request.getParameter("checkOutDate"));
                float price = 0;
                long lama = ((((checkout.getTime() - checkin.getTime())/1000)/60)/60)/24;
                price = (float)(lama) * Float.parseFloat(request.getParameter("price"));
                price = price + (price * 12 / 100);
                Booking booking = new Booking(user_id, room_id, checkin, checkout,"pending", price);
                bookingservice.book(booking);
                response.sendRedirect("landingpage.jsp");
            }
        }
    }
    protected void doDel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String booking_id = request.getParameter("booking_id");
        bookingservice.delBook(booking_id);
        doGet(request, response);
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
