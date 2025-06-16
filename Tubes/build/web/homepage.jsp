<%-- 
    Document   : homepage
    Created on : 1 Jan 2025, 20.50.27
    Author     : vandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
              session = request.getSession();
              User user = (User) session.getAttribute("user");
              if (user == null) {
                out.println("silahkan login/register");
                }else{
                    out.println("selamat datang " + user.getUsername());
                }
            %>
        </h1>
        <%
            String status = request.getParameter("id");
            if ("1".equals(status)) {
                out.println("<h1> login/register berhasil! <h1>");
            }
            
        %>
    </body>
</html>
