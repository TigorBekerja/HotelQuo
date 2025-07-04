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

import model.Hotel;
import service.HotelService;
import javax.servlet.RequestDispatcher;
import java.util.ArrayList;

/**
 *
 * @author vandi
 */
@WebServlet(name = "HotelController", urlPatterns = {"/HotelController"})
public class HotelController extends HttpServlet {
    HotelService hotelservice = new HotelService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        
        if ("location".equals(method)) {
            String location = request.getParameter("location");
            ArrayList<Hotel> arr_hotel = hotelservice.searchHotelsByLocation(location);
            request.setAttribute("arr_hotel", arr_hotel);
            RequestDispatcher rd = request.getRequestDispatcher("aftersearch.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
