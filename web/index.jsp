<%-- 
    Document   : index
    Created on : 07-may-2018, 20:24:51
    Author     : alexlopez
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Product"%>
<%@page import="dao.TechShopDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TechShop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="row" style="margin-bottom: 50px; margin-top: 50px">
            <div class="col-sm-4">
                <img src="img/TechShop-Logo-2.png" alt="logo" style="display:block; margin:auto;"/>
            </div>
            <div class="col-sm-4">
                <h1>Login</h1>
                <form action="Login" method="POST">
                    <p>Email: <input type="text" name="email" placeholder="email" required></p>
                    <p>Password: <input type="password" name="pass" placeholder="password" required></p>
                    <input type="submit" value="Log In" class="btn btn-primary">
                </form>
            </div>
            <div class="col-sm-4">
                <h1>Register</h1>
                <form action="Register" method="POST">
                    <p>Email: <input type="email" name="email" placeholder="email" required></p>
                    <p>Password: <input type="password" name="contraseña" placeholder="pass" required></p>
                    <p>Confirm Password: <input type="password" name="checkpass" placeholder="pass" required></p>
                    <input type="submit" value="Sign In" class="btn btn-primary">
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12" style="margin-left: 15px">
                <h3>New Products</h3>
            </div>
        </div>
        <%
            TechShopDAO techShopDAO = new TechShopDAO();
            //Get all products
            List<Product> products = techShopDAO.allProducts();
        %>
        <div class="row">
            <div class="col-sm-12">
                <table style="width:100%" class="table table-striped">
                    <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Description</th> 
                    </tr>
                    <% 
                        //Load products
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
                            </tr>
                    <%
                            }
                        }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
