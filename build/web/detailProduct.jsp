<%@page import="dao.DAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product" %>
<%@page import="entity.Category" %>
<%@page import="entity.AccountDTO" %>
<%@page import="entity.Order" %>
<%@page import="entity.Items" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
     <%@include file="header/header.jsp" %>
    <!-- Topbar End -->


    <!-- Navbar Start -->
        <%@include file="navbar/navbar.jsp" %>

    <!-- Navbar End -->


    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="HomeServlet">Home</a>
                    <span class="breadcrumb-item active">Shop Detail</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Shop Detail Start -->
    <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="${result.getImage()}" alt="Image">
                        </div>
                       
                     
                        
                    </div>
                  
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30">
                <div class="h-100 bg-light p-30">
                                  <input type="hidden" id="account" value="${uid.getuID()}">
                                   <input type="hidden" id="pid" value="${result.getId()}">
                                     <input type="hidden" id="price" value="${result.getPrice()}">
                                     <input type="hidden" id="name" value="${result.getName()}">
                    <h3>${result.getName()}</h3>
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star-half-alt"></small>
                            <small class="far fa-star"></small>
                        </div>
                        <small class="pt-1">(99 Reviews)</small>
                    </div>
                    <h3 class="font-weight-semi-bold mb-4">Gia: ${result.getPrice()}</h3>                                                                      
                    <p class="mb-4">${result.getDescription()}</p>
                <button class="btn btn-primary px-3"  type="button"id="add"><i class="fa fa-shopping-cart mr-1" ></i> Add To Cart</button>             
                </div>
            </div>
        </div>
    
    </div>


    <!-- Footer Start -->
     <%@include file="footer/footer.jsp" %>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

     <script>
          $(document).ready(function(){        
            $('#add').click(function(){
             var account = $("#account").val();
             var pid = $("#pid").val();
              var price = $("#price").val();
               var name = $("#name").val();
             console.log(account);
       if(!account){
           window.location.href = 'login.jsp';
       }else
    	    $.ajax({
                 type: "POST",
                                url : "detailProduct",
                                data: {uid: account,pid:pid,price:price,name: name},
               success: function(check){
                   if(check){
                       toastr.error(check);
                   }else
                   toastr.success("Add To Cart Successfully");
               }
            });
    });
    
        });
      
    </script>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
     <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>