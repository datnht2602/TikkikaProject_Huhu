<%-- 
    Document   : login
    Created on : Jul 8, 2022, 5:59:03 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.AccountDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="abc.css"/>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css"
            rel="stylesheet"
            />
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container  mt-5  px-lg-5">
            <section class="vh-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6 text-black">

                            <div class="px-5 ms-xl-4">
                                <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
                                <span class="h1 fw-bold mb-0">Logo</span>
                            </div>
                            <br>
                            <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                                <form action="AddAccountServlet" method="post" style="width: 23rem;">

                                    <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign Up</h3>
                                        <c:if test="${error}">
                                            <c:forEach items="${error}" var="o">
                                        <div class="alert alert-danger" role="alert">
                                            ${o}
                                            </div>                             
                                        </c:forEach>
                                            </c:if>
                                                      <div class="form-outline mb-4">
                                        <input name="fullname" type="text" id="form2Example18" class="form-control form-control-lg">
                                        <label class="form-label" for="form2Example18" style="margin-left: 0px;">Fullname</label> 

                                        <div class="form-notch">
                                            <div class="form-notch-leading" style="width: 9px;">
                                            </div>
                                            <div class="form-notch-middle" style="width: 88.8px;"></div>
                                            <div class="form-notch-trailing">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input name="user" type="text" id="form2Example18" class="form-control form-control-lg">
                                        <label class="form-label" for="form2Example18" style="margin-left: 0px;">Username</label> 

                                        <div class="form-notch">
                                            <div class="form-notch-leading" style="width: 9px;">
                                            </div>
                                            <div class="form-notch-middle" style="width: 88.8px;"></div>
                                            <div class="form-notch-trailing">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input id="password-field" name="pass" type="password" id="form2Example18" class="form-control form-control-lg">
                                      
                                        <label class="form-label" for="form2Example18" style="margin-left: 0px;">Password</label>
                                        
                                        <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 88.8px;"></div><div class="form-notch-trailing"></div></div></div>

                                    <div class="form-outline mb-4">
                                        <input name="repass" type="password" id="form2Example18" class="form-control form-control-lg">
                                        <label class="form-label" for="form2Example18" style="margin-left: 0px;">Re-pass</label>
                                        <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 88.8px;"></div><div class="form-notch-trailing"></div></div></div>
                                  
                                        <font color="red">  ${mess}</font>
                                        


                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-info btn-lg btn-block" id="btn" type="submit">Sign Up</button>
                                    </div>

                                    <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>
                                    <p>Already Have an account? <a href="login.jsp" class="link-info">Login</a></p>

                                </form>

                            </div>

                        </div>
                        <div class="col-sm-6 px-0 d-none d-sm-block">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
                                 alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
                        </div>
                    </div>
                </div>
            </section>
        </div>                                       
    </body>
</html>
