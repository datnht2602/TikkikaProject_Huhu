<%-- 
    Document   : index
    Created on : Jun 6, 2022, 7:31:39 AM
    Author     : Derek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.io.*,java.util.*" %>
<%@page import="entity.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>List Account</h2>
            <table id="table"class="table table-bordered">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>isSell</th>
                        <th>Role</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listA}" var="dto"  >
                        <tr>
                            <td >${dto.getuID()}<input type="hidden" name="id" value="${dto.getuID()}" /></td>
                            <td style="text-align:center;">${dto.getUsername()}</td>
                            <td style="text-align:center;">${dto.getPassword()}</td>
                            <td>${dto.getIsSell()}</td>
                            <td>${dto.getIsAdmin()}</td>
                            <td>
                                <c:url var="updateLink" value="UpdateAccountServlet">
                                    <c:param name="pk" value="${dto.getuID()}"/>
                                </c:url>
                                
                                <a class="btn btn-primary btn-sm" href="${updateLink}">Update</a>
                                
                                <c:url var="delLink" value="DeleteAccountServlet">
                                    <c:param name="pk" value="${dto.getUsername()}"/>
                                </c:url>
                                | <a class="btn btn-danger btn-sm" href="${delLink}">Delete</a></td>
                        </tr>		                            
                    </c:forEach>
                </tbody>
            </table>
            <!--<a href="AddAccount" class="btn btn-primary">Add New Account</a>-->
            <a href="HomeServlet" class="btn btn-primary">Return HomePage</a>
        </div>
<script>
    $(document).ready(function () {
        $('#table').DataTable();
    });
</script>
    </body>
    
</html>

