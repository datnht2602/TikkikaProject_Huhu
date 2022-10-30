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
				<h2>Chinh Sua</h2>
				<form action="UpdateProductServlet" method="POST">
                                    <input type="hidden" name="id" class="form-control" placeholder="Enter UserName" value="${result.getId()}">
					<div class="form-group">
						<label>name</label> 
						<input type="text" name="name" class="form-control" placeholder="Enter UserName" value="${result.getName()}">
                                                
					</div>				
                                    <div class="form-group">
						<label>price</label> 
						<input type="text" name="price" class="form-control" placeholder="Enter Price" value="${result.getPrice()}">
                                        </div>
                                          <div class="form-group">
						<label>title</label> 
						<input type="text" name="title" class="form-control" placeholder="Enter title" value="${result.getTitle()}">
                                        </div>  
                                          <div class="form-group">
						<label>description</label> 
						<input type="text" name="description" class="form-control" placeholder="Enter description" value="${result.getDescription()}">
                                        </div>
                               <div class="form-group">
						<label>photo</label> 
						<input type="text" name="image" class="form-control" placeholder="Enter description" value="${result.getImage()}">
                                                <img src="${result.getImage()}" width="120" height="150">
                                        </div> 
                        	<div class="form-group">
								<label>category</label> 
                                                                <div>
                                                                    <select name="category" >
  <c:forEach var="dept" items="${category}" >
            <option value="${dept.getId()}" ${dept.getId()== result.getCateID() ? "selected":""}>${dept.getName()}</option>
        </c:forEach>
</select>
                                                                </div>
                                        </div>
					<button type="submit" class="btn btn-primary">Luu</button>
                                          <a class="btn btn-primary" href="DisplayProductServlet">Huy Bo</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>