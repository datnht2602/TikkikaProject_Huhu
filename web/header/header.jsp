<%-- 
    Document   : header
    Created on : Sep 19, 2022, 2:00:47 PM
    Author     : Derek
--%>
<%@page import="dao.DAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<%@page import="entity.AccountDTO" %>
<%@page import="entity.Order" %>
<%@page import="entity.Items" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container-fluid">
        
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="HomeServlet" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Tikkika</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Market</span>
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
                <form action="SearchServlet" method="post">
                    <div class="input-group">
                        <input name="search" type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
               <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <c:if test="${sessionScope.acc.getIsAdmin() == 1}">
                            <a href="DisplayAccountServlet" class="btn px-0 ml-3" style="color: black">
                                <i class="fas fa-info text-primary" ></i>
                                My account
                            </a>
                            </c:if>
                               
                              <c:if test="${sessionScope.acc != null}">
                            <a href="login.jsp" class="btn px-0 ml-3" style="color: black">
                                <i class="fas fa-info text-primary" ></i>
                               Hello ${sessionScope.acc.getUsername()}
                            </a>
                               <a href="LogOutControl" class="btn px-0 ml-3" style="color: black">
                                <i class="fas fa-info text-primary" ></i>
                              Logout
                            </a>
                            </c:if>
                             <c:if test="${sessionScope.acc == null}">
                            <a href="login.jsp" class="btn px-0 ml-3" style="color: black">
                                <i class="fas fa-info text-primary" ></i>
                                Dang Nhap
                            </a>
                            </c:if>
<!--                            <a href="" class="btn px-0 ml-3" style="color: black">
                                <i class="fas fa-shopping-cart text-primary"></i>
                                Gio Hang
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>-->
                        </div>
        </div>
    </div>
    </body>
</html>
