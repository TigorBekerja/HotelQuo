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

import model.User;
import service.UserService;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author vandi
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {
    UserService userService = new UserService();
    
    
    @Override
    // get user ketika login
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = userService.searchUser(email);
        if (user == null) {
            response.sendRedirect("login.jsp?id=3");
        }else{
            String password = request.getParameter("password");
            User temp = new User();
            if (Integer.toString(temp.hashCode(password)).equals(user.getPassword())) {
                HttpSession sess = request.getSession();
                sess.setAttribute("user", user);
                response.sendRedirect("landingpage.jsp?id=1");
            }else{
                response.sendRedirect("login.jsp?id=2");
            }
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
        String method = request.getParameter("method");
        if ("edit".equalsIgnoreCase(method)) {
            doPut(request, response);
        }else{
            String email = request.getParameter("email");
            if (userService.searchUser(email) != null) {
                response.sendRedirect("login.jsp?id=4");
            }else{
                String username = request.getParameter("username");
                String password =request.getParameter("password");
                User user = new User();
                user = new User(username, Integer.toString(user.hashCode(password)), email);
                userService.saveUser(user);
                HttpSession sess = request.getSession();
                sess.setAttribute("user", user);
                response.sendRedirect("landingpage.jsp?id=1");
            }
        }
    }

    // edit profile
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setFull_name(request.getParameter("full_name"));
        user.setCountry(request.getParameter("country"));
        user.setDOB(Date.valueOf(request.getParameter("DOB")));
        user.setPhone_number(request.getParameter("phone_number"));
        
        session.setAttribute("user", user);
        userService.editUser(user);
        response.sendRedirect("profil.jsp?id=1");
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
