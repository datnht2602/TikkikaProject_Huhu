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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"">
    <title>Tikkika Market - Secondhand Online Shop Website</title>
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


<div class="container">
    <div class ="row">
        <div class="col-md-4">
            <p>ChatBox</p>
            <p> Send message to : </p>
            <input type="hidden" id="fromUser" value="${uid.getuID()}" type="text">
            <ul>
                <c:forEach items="${listAcc}" var="dto" >
                    <li><a href="?toUser=${dto.getuID()}">${dto.getName()}</a></li>
                    
                </c:forEach>
            </ul>
        </div>
         <div class="col-md-4">
             <div class="modal-dialog">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h4>
                             ${uName.getName()}
                             <input type="hidden" id="toUser" value="${uName.getuID()}" type="text">
                         </h4> 
                     </div>
                         <div class="modal-body" id="msgBody" style="height:400px; overflow-y: scroll; overflow-x: hidden">
                             <c:forEach items="${chats}" var = "dto">
                                 <c:choose>
                                     <c:when test="${dto.getFromUser()== uid.getuID()}">
                                         <div style="text-align: right;">
                                             <p style="background-color: lightblue;word-wrap: break-word; display:inline-block; padding: 5px;border-radius: 10px; max-width: 70% ">
                                               ${dto.getMessage()}  
                                             </p>
                                             
                                         </div>
                                     </c:when>
                             
                                     <c:otherwise>
                                               <div style="text-align: left;">
                                             <p style="background-color: lightblue;word-wrap: break-word; display:inline-block; padding: 5px;border-radius: 10px; max-width: 70% ">
                                               ${dto.getMessage()}  
                                             </p>
                                             
                                         </div>
                                     </c:otherwise>
                                 </c:choose>
                             </c:forEach>
                         </div>
                         <div class="modal-footer">
                             <textarea id="message" class="form-control" style="height:70px;"></textarea>
                             <button id="send" class="btn btn-primary" style="height: 70%; ">Send</button>
                         </div>
                 </div>
             </div>
        </div>
         <div class="col-md-4">
            
        </div>
    </div>
		
	</div>
<!-- Modal -->



    <!-- Footer Start -->
    <%@include file="footer/footer.jsp" %>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

        <script>
          $(document).ready(function(){        
           $("#send").on("click",function(){
               var mess= $("#message").val();
               console.log(mess);
               $.ajax({
                  url:"insertMessage",
                  method:"POST",
                  data:{
                      fromUser: $("#fromUser").val(),
                      toUser: $("#toUser").val(),
                      message: mess
                  },
                  dataType:"text",
                  success:function(data){
                      $("#message").val("");
                  }
               })
           });
    
//    setTimeout(function(){
//    location = ''
//  },600)

//           setInterval(function(){
//               $.ajax({
//                   url:"realTimeChat",
//                   method:"POST",
//                   data:{
//                      fromUser: $("#fromUser").val(),
//                      toUser: $("#toUser").val()
//                   },
//                   dataType:"text",
//                   success:function(data){
//                      $("#msgBody").html(data);
//                  }
//               })
//           },700);
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