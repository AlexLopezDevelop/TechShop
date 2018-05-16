<%-- 
    Document   : Admin
    Created on : 05-may-2018, 16:51:21
    Author     : alexlopez
--%>

<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
        <title>Admin Panel</title>
    </head>
    <%
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if (user.getAdmin() != 0) {
    %>
        <body>
            <div class="row" style="margin-bottom: 50px; margin-top: 10px; margin-left: 20px">
                <div class="col-sm-10">
                    <h1>Admin Panel</h1>
                </div>
                <div class="col-sm-2">
                    <input type="button" class="btn btn-warning" value="Return Normal" onclick="location.href='Home.jsp';"/>
                    <input type="button" class="btn btn-danger" value="Log out" onclick="location.href='Logout';"/>
                </div>
            </div>
            <div class="row" style="margin-bottom: 50px; margin-top: 10px; margin-left: 20px">
                <div class="col-sm-1">
                    <input type="button" class="btn btn-primary" value="Add product" onclick="location.href='AddProduct.jsp';"/>
                </div>
                <div class="col-sm-1">
                    <form action="<%= request.getContextPath()%>/AllUsers" method="POST">
                         <input type="submit" class="btn btn-primary" value="Delete use"/>
                    </form>
                </div>
                <div class="col-sm-1">
                    <form action="<%= request.getContextPath()%>/TopUsers" method="POST">
                         <input type="submit" class="btn btn-primary" value="Top users"/>
                    </form>
                </div>
            </div>
        </body>
    <%
            } else {
    %>
                <div class="row" style="margin-bottom: 50px; margin-top: 10px; margin-left: 20px">
                    <div class="col-sm-12">
                        <h1>Restricted Access</h1>
                    </div>
                </div>
    <%
            }
        } else {
    %>
            <body>
                <% response.sendRedirect("../index.html"); %>
            </body>
    <%
        }
    %>
</html>
