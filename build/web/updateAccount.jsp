<%-- 
    Document   : book
    Created on : Jun 6, 2022, 9:15:30 AM
    Author     : Derek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" style="margin-top: 10px;">
            <div class="row"
                 style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
                <div class="col-sm-12">				
                    <h2>Add Class</h2>
                    <form action="UpdateAccountServlet" method="POST">

                        <input type="hidden" name="id" class="form-control" placeholder="Enter UserName" value="${result.getuID()}">
                        <div class="form-group">
                            <label>Username</label> 
                            <input type="text" name="name" class="form-control" placeholder="Enter UserName" value="${result.getUsername()}" readonly>
                        </div>				
                        <div class="form-group">
                            <label>Password</label> 
                            <input type="password" name="pass" class="form-control" placeholder="Enter Password" value="${result.getPassword()}">
                        </div>
                        <div class="form-group">
                            <label>Sell</label> 
                            <div class="radio">
                                <label class="checkbox-inline">
                                    <input type="radio" name="sell" ${result.getIsSell()==0 ? "checked":""}  value="0"  >0</label>                               
                                <label class="checkbox-inline">
                                    <input type="radio" name="sell" ${result.getIsSell()==1 ? "checked":""} value="1"  > 1</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Role</label> 
                            <div class="radio">
                                <label class="checkbox-inline">
                                    <input type="radio" name="role" ${result.getIsAdmin()==0 ? "checked":""} value="0"  >User</label>                               
                                <label class="checkbox-inline">
                                    <input type="radio" name="role" ${result.getIsAdmin()==1 ? "checked":""} value="1"  > Admin</label>
                            </div>
                        </div>
                     
                   
                        <button type="submit" class="btn btn-primary">Save</button>
                        <a class="btn btn-primary" href="DisplayAccountServlet">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>