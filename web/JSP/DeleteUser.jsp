<%-- 
    Document   : DeleteUser
    Created on : 07-may-2018, 16:42:27
    Author     : alexlopez
--%>

<%@page import="java.util.List"%>
<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
    <%
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if (user.getAdmin() != 0) {
    %>
    <body>
        <h1>Select user for detele:</h1>
        <% 
            List <User> users = (List<User>) request.getAttribute("Users");
            if(users.isEmpty()){
                System.out.println("No users");
            } else{
        %>
                <form action="<%= request.getContextPath()%>/DeleteUser" method="POST">
                    <select name="id">
        <%
                        for(User u : users){
        %>
                            <option value="<%= u.getIduser() %>"><%= u.getEmail() %></option>
        <%  
                        }
        %>
                    </select>
                    <input type="submit" class="btn btn-danger" value="Delete"/>
                </form>
        <%
            }
        %>
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
