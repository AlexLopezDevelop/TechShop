<%-- 
    Document   : Status
    Created on : 12-abr-2018, 16:12:09
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
        <title>Status</title>
    </head>
    <body>
        <%
            String status = (String) request.getAttribute("Status");
            if (session.getAttribute("user") != null) {
                                
        %>
                <input type="button" class="btn btn-warning" value="Home" onclick="location.href='<%= request.getContextPath()%>/JSP/Home.jsp';"/>
        <%
            } else {
        %>
                <input type="button" class="btn btn-info" value="Index" onclick="location.href='<%= request.getContextPath()%>/index.jsp';"/>
        <%        
            }
        %>
        <h1> <%= status %></h1>
    </body>
</html>
