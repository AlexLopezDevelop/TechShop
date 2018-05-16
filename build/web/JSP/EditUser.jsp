<%-- 
    Document   : EditUser
    Created on : 10-may-2018, 16:01:40
    Author     : alexlopez
--%>

<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
    </head>
    <%
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
    %>
    <body>
        <h1>Editar: <%= user.getEmail() %> </h1>
        <div class="col-sm-4">
            <h1>Login</h1>
            <form action="<%= request.getContextPath()%>/EditUser" method="POST">
                <p><input type="hidden" name="email" placeholder="email" value="<%= user.getEmail() %>" required></p>
                <p>Old Password: <input type="password" name="oldpass" placeholder="old password" required></p>
                <p>Password: <input type="password" name="password" placeholder="password" required></p>
                <p>Confirm Password: <input type="password" name="checkpass" placeholder="confirm password" required></p>
                <input type="submit" value="Edit User" class="btn btn-primary">
            </form>
        </div>
    </body>
    <%
        } else {
    %>
            <body>
                <% response.sendRedirect("../index.html"); %>
            </body>
    <%
        }
    %>
</html>
