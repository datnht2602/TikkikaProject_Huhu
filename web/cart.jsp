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
                    <span class="breadcrumb-item active">Shopping Cart</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead style="color: dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                        
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                          <input type="hidden" id="list" value="${list}"> 
                        <c:forEach items="${list}" var="dto">
                        <tr>
                                 <input type="hidden" id="uid" value="${dto.getUid()}">
                                 <input type="hidden" id="pid" value="${dto.getPid()}">                              
                                         <input type="hidden" id="name" value="${dto.getName()}">
                            <td class="align-middle"><img src="${dto.getImage()}" alt="" style="width: 50px;"> ${dto.getName()}</td>
                            <td class="align-middle">$${dto.getPrice()}</td>
                       
                            <td class="align-middle"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></td>
                        </tr>
                       </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="pt-2">
                            <div class="border-bottom">
                        <h6 class="mb-3">Products</h6>
                        <c:forEach items="${list}" var="dto">
                        <div class="d-flex justify-content-between">
                            <p>${dto.getName()}</p>
                            <p>${dto.getPrice()}</p>
                        </div>
                       </c:forEach>
                    </div>
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5 id ="result">${result}</h5>
                        </div>
                        <button class="btn btn-block btn-primary font-weight-bold my-3 py-3" data-toggle="modal" data-target="#checkout-form">Place Order</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Cart End -->
<div class="modal fade" id="checkout-form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Xac Nhan</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Xac Nhan Don Hang 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dong</button>
        <button type="button" class="btn btn-primary order" id="order">Xac Nhan</button>
      </div>
    </div>
  </div>
</div>

    <!-- Footer Start -->
     <%@include file="footer/footer.jsp" %>
    <!-- Footer End -->

     <script>
                 $(document).ready(function(){        
              var row;
                  $(".btn-danger").click(function(){
           var uid = $("#uid").val();
             var pid= $("#pid").val();
              var name= $("#name").val();
             row = $(this);
                $.ajax({
                 type: "POST",
                                url : "DeleteCart",
                                data: {uid: uid,pid:pid,name: name},
               success: function(){
                   toastr.success("Deleted successfully");
                  $(row).closest('tr').remove();
               }
            });
        });
                  $("#order").click(function(){
           var uid = $("#uid").val();
             var list= $("#list").val();
                $.ajax({
                 type: "POST",
                                url : "CheckOutServlet",
                                data: {uid: uid,list:list},
               success: function(){
                  location.href='HomeServlet';
               }
            });
        });
   var _updatePrice = setInterval(function(){
       var uid = $("#uid").val();
    	$.ajax({
    		url:'getTotalCart',
    		method:'POST',
    		data:{uid:uid},
    		success:function(result){
    				$('#result').text(result)
    		
    		}
    	})
    },1000)
        });
      
    </script>

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


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