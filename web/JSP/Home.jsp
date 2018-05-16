<%-- 
    Document   : Home
    Created on : 04-may-2018, 13:51:25
    Author     : alexlopez
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entities.Product"%>
<%@page import="entities.User"%>
<%@page import="dao.TechShopDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
        <title>Inicio</title>
    </head>
    <%
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
    %>
            <body>
                <div class="row" style="margin-bottom: 50px; margin-top: 10px; margin-left: 20px">
                    <div class="col-sm-8">
                        <h1>Hola <%= user.getEmail() %></h1>
                        <% if (request.getAttribute("categories") != null && request.getAttribute("order") != null) { %>
                        <%= request.getParameter("categories")%>
                        <%= request.getParameter("order")%>
                        <%}%>
                    </div>
                    <div class="col-sm-4">
                        <%
                            if (user.getAdmin() != 0) {
                                
                        %>
                                <input type="button" class="btn btn-warning" value="Admin Panel" onclick="location.href='<%= request.getContextPath()%>/JSP/Admin.jsp';"/>
                        <%
                            }
                        %>
                        <input type="button" class="btn btn-primary" value="Edit" onclick="location.href='<%= request.getContextPath()%>/JSP/EditUser.jsp';"/>
                        <form action="<%= request.getContextPath()%>/Logout" method="POST">
                            <input type="submit" class="btn btn-danger" value="Log Out"/>
                        </form>
                    </div>
                </div>
                <form action="<%= request.getContextPath()%>/SearchTable" method="POST">
                <div class="row">        
                        <div class="col-sm-4" style="margin-left: 15px">
                            <h3>New Products</h3>
                        </div>
                        <div class="col-sm-2">       
                            <div class="form-group">
                                <label>Categories:</label>
                                <select name="categories" class="form-control" id="sel1">
                                    <option value="laptop">Laptop</option>
                                    <option value="desktop">Desktop</option>
                                    <option value="smartphone">Smartphone</option>
                                    <option value="gadget">Gadget</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-2">       
                            <div class="form-group">
                                <label>Order</label>
                                <select name="order" class="form-control" id="sel1">
                                    <option value="low">Lowest price</option>
                                    <option value="highest ">Highest price</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <input type="submit" class="btn btn-info" value="Filter" style="margin-top: 30px"/>
                        </div>
                </div>
                </form>
                <div class="row">
                    <div class="col-sm-12">
                        <table style="width:100%" class="table table-striped">
                    <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Description</th> 
                        <th>Price</th>
                        <th></th>
                    </tr>
                    <% 
                        TechShopDAO techShopDAO = new TechShopDAO();
                        //Load products
                        
                        List<Product> products = new ArrayList<Product>();
                        
                        if (request.getAttribute("List") != null) {
                            products = (List<Product>) request.getAttribute("List");
                        } else {
                            products = techShopDAO.allProducts();
                        }
                        
                        if(products.isEmpty()){
                            System.out.println("No users");
                        }else{
                            for(Product product : products){
                    %>
                            <tr>
                                <td>
                    <%=
                                product.getName()
                    %>
                                </td>
                                <td>
                    <%=
                                product.getCategory()
                    %>
                                </td>
                                <td>
                    <%=
                                product.getDescription()
                    %>
                                </td>
                                <td>
                    <%=
                                product.getPrice()
                    %>
                                </td>
                                <td>
                                    <form action="<%= request.getContextPath()%>/BuyProduct" method="POST">
                                        <input type="hidden" name="idproduct" value="<%= product.getIdproduct() %>">
                                        <input type="submit" value="Buy" class="btn btn-success">
                                    </form>
                                </td>
                            </tr>
                    <%
                            }
                        }
                    %>
                </table>
                    </div>
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
