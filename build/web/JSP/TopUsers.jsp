<%-- 
    Document   : TopUsers
    Created on : 15-may-2018, 22:49:14
    Author     : alexlopez
--%>

<%@page import="aux.TopUser"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top Users</title>
    </head>
    <body>
        <h1>Podium</h1>
        <%
            List <TopUser> users = (List<TopUser>) request.getAttribute("Users");
            %>
        <div class="row">
            <div class="col-sm-12">
                <table style="width:100%" class="table table-striped">
                    <tr>
                        <th>Email</th>
                        <th>Spend</th>
                    </tr>
                    <% 
                        //Load products
                        if(users.isEmpty()){
                            System.out.println("No users");
                        }else{
                            for(TopUser user : users){
                    %>
                            <tr>
                                <td>
                    <%=
                                user.getEmail()
                    %>
                                </td>
                                <td>
                    <%=
                                user.getSpentMoney()
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
