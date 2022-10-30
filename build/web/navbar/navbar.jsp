<%-- 
    Document   : navbar
    Created on : Sep 19, 2022, 2:01:46 PM
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
<% 
        AccountDTO a = (AccountDTO) session.getAttribute("acc");
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                    <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Muc Luc</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                    <div class="navbar-nav w-100">
<!--                        <div class="nav-item dropdown dropright">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                <a href="" class="dropdown-item">Men's Dresses</a>
                                <a href="" class="dropdown-item">Women's Dresses</a>
                                <a href="" class="dropdown-item">Baby's Dresses</a>
                            </div>
                        </div>-->
                                <c:forEach items="${category}" var="o">
                                     <a href="category?id=${o.getId()}" class="nav-item nav-link">${o.getName()}</a>                              
                                        </c:forEach>
                 
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                        <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="HomeServlet" class="nav-item nav-link active">Trang Chu</a>
                           
                            <a href="DisplayProductServlet" class="nav-item nav-link">Quan Li Tin Tuc</a>
<!--                            <a href="detail.html" class="nav-item nav-link">Order</a>-->
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Don Hang <i class="fa fa-angle-down mt-1"></i></a>
                                <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                    <a href="cart.html" class="dropdown-item">Don Sale</a>
                                    <a href="checkout.html" class="dropdown-item">Don Purchase</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Chat</a>
                            <a href="contact.html" class="nav-item nav-link">Thong Bao</a>
                                <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dau Gia <i class="fa fa-angle-down mt-1"></i></a>
                                <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                    <a href="ManageAuctionServlet" class="dropdown-item">Quan Ly San Pham</a>
                                    <a href="DisplayBids" class="dropdown-item">Thong Tin Dau Gia</a>
                                    <a href="DisplayAuctionServlet" class="dropdown-item">Danh Sach San Pham</a>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                </nav>
            </div>
        </div>
    </div>
    </body>
</html>
