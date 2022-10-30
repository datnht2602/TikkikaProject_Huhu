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
</head>
<body>
	<div class="container">
		<h2>List Product</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>image</th>
                                        <th>description</th>
                                        <th>Action</th>
				</tr>
			</thead>
			<tbody>
                            	<c:forEach items="${list}" var="dto"  >
                                <tr>
				<td >${dto.getId()}
                                    <input type="hidden" name="id" value="${dto.getId()}" />
                                </td>
				<td style="text-align:center;">${dto.getName()}
                                    
                                </td>
                               
                                 <td><img src="${dto.getImage()}" width="120" height="150">
                                    
                                </td>
                                 <td>${dto.getDescription()}
                                    
                                </td>
                                 <td>
                                    <c:url var="updateLink" value="UpdateProductServlet">
                                        <c:param name="pk" value="${dto.getId()}"/>
                                    </c:url>
                                    <a class="btn btn-primary btn-sm" href="${updateLink}">Update</a>
                                <c:url var="delLink" value="DeleteProductServlet">
                                        <c:param name="pk" value="${dto.getName()}"/>
                                    </c:url>
				| <a class="btn btn-danger btn-sm" href="${delLink}">Delete</a></td>
				</tr>		                            
                        </c:forEach>
			</tbody>
		</table>
                        <a href="AddProductServlet" class="btn btn-primary">Add New Product</a>
                        <a href="HomeServlet" class="btn btn-primary">Return HomePage</a>
	</div>

</body>
</html>

