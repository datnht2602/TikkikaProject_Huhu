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
				<h2>Them San Pham</h2>
				<form action="AddProductServlet" method="POST">
					<div class="form-group">
						<label>name</label> 
						<input type="text" name="name" class="form-control" placeholder="Enter UserName" value="${param.ClassName}">
                                                
					</div>				
                                    <div class="form-group">
						<label>price</label> 
						<input type="text" name="price" class="form-control" placeholder="Enter Price" value="${param.Description}">
                                        </div>
                                          <div class="form-group">
						<label>title</label> 
						<input type="text" name="title" class="form-control" placeholder="Enter title" value="${param.Description}">
                                        </div>  
                                          <div class="form-group">
						<label>description</label> 
						<input type="text" name="description" class="form-control" placeholder="Enter description" value="${param.Description}">
                                        </div>
                               <div class="form-group">
						<label>photo</label> 
						<input type="text" name="image" class="form-control" placeholder="Enter description" value="${param.Description}">
                                        </div> 
                        	<div class="form-group">
								<label>category</label> 
                                                                <div>
                                                                    <select name="category" >
  <c:forEach var="dept" items="${category}" >
            <option value="${dept.getId()}">${dept.getName()}</option>
        </c:forEach>
</select>
                                                                </div>
                                        </div>
					<button type="submit" class="btn btn-primary">Save</button>
                                          <a class="btn btn-primary" href="DisplayServlet">Cancel</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>