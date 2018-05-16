<%-- 
    Document   : AddProduct
    Created on : 15-may-2018, 20:05:30
    Author     : alexlopez
--%>

<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
     <%
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if (user.getAdmin() != 0) {
    %>
    <body>
        <h1>Add a new product</h1>
        <form action="<%= request.getContextPath()%>/AddProduct" method="POST">
            <p>Name: <input type="text" name="name" placeholder="name" required></p>
                <p><select name="categories" class="form-control" id="sel1">
                                    <option value="laptop">Laptop</option>
                                    <option value="desktop">Desktop</option>
                                    <option value="smartphone">Smartphone</option>
                                    <option value="gadget">Gadget</option>
                                </select></p>
                <p>Description: <input type="text" name="description" placeholder="description" required></p>
                <p>Price <input type="number" name="price" placeholder="price" required></p>
                <input type="submit" value="Add product" class="btn btn-primary">
            </form>
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
