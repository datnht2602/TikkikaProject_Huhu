<%@page import="entity.InforPayment"%>
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
    <!-- Breadcrumb End -->


    <!-- Shop Detail Start -->

     
    <div class="container-fluid pt-5 pb-3">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Thong Tin Dat Hang</span></h2>
    <div class="table-content table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="li-product-remove">Shipping Details</th>
                                                <th class="li-product-thumbnail">images</th>
                                                <th class="cart-product-name">Product</th>
                                                <th class="li-product-price">Price</th>
                                                <th class="li-product-quantity">Purchase Time</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listPayment}" var="dto">
                                            <tr>
                                                <td class="li-product-remove">Name: ${dto.getNameUser()}<br>
                                                    Email: ${dto.getEmail()}<br>
                                                    Address ${dto.getAddress()}<br>
                                                    Phone: ${dto.getPhone()}
                                                </td>
                                                <td class="li-product-thumbnail"><img src="${dto.getImage()}" alt="Li's Product Image" width="120" height="150"></td>
                                                <td class="li-product-name"><a href="detailProduct?id=${dto.getPid()}">${dto.getNameProduct()}</a></td>
                                                <td class="li-product-price"><span class="amount">${dto.getPrice()}</span></td>
                                             
                                                <td class="product-subtotal"><span class="amount">${dto.getDate_created()}</span></td>
                                            </tr>
                                     </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
    </div>
 


    <!-- Products Start -->
    
    <!-- Products End -->


    <!-- Footer Start -->
     <%@include file="footer/footer.jsp" %>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
<style type="text/css">
	#bid-frm{
		display: none
	}
</style>

     <script>
          $(document).ready(function(){        
              var row;
                  $(".callModal").click(function(){
            var id = $(this).data('id');
            console.log("Chuan bi xoa san pham id : " + id);
             row = $(this);
            $("#category_id").val(id);
        });
          $("#deleteCate").click(function(){
            var pk = $("#category_id").val();
            $.ajax({
                 type: "GET",
                                url : "DeleteProductServlet",
                                data: {pk: pk},
               success: function(){
                   toastr.success("Deleted successfully");
                  $(row).closest('tr').remove();
                    $('#delete').modal('hide');
               }
            });
        });
         $('#bid').click(function(){
             var account = $("#account").val();
             var currentuid= $("#currentuid").val();
       if(!account){
           window.location.href = 'login.jsp';
       }
       console.log(currentuid);
    	$('#bid-frm').show();
    });
     	 window.start_load = function(){
    $('body').prepend('<di id="preloader2"></di>')
  }
  window.end_load = function(){
    $('#preloader2').fadeOut('fast', function() {
        $(this).remove();
      })
  }
   var _updateBid = setInterval(function(){
       var auction_id = $("#auction_id").val();
    	$.ajax({
    		url:'getHighestBidding',
    		method:'POST',
    		data:{product_id:auction_id},
    		success:function(responseText){
    			var sec = parseInt(responseText);
                        if(sec && sec > 0)
    				$('#hbid').text(responseText)
    		
    		}
    	})
    },1000)
     $('#manage-bid').submit(function(e){
    	e.preventDefault()
            start_load();
            var latest = $('#hbid').text();
            var auction_id = $("#auction_id").val();
             var currentuid= $("#currentuid").val();
             var account = $("#account").val();
              var currentid = $("#currentid").val();
//            latest = latest.replace(/,/g,'');
            console.log(latest,auction_id,currentid);
            if(parseFloat(latest)  > $('[name="bid_amount"]').val()){
            	toastr.error("Bid amount must be greater than the current Highest Bid.");
            	end_load();
            	return false;
            }
               else if(account === currentuid){
            	toastr.error("The current highest bid is yours.");
            	end_load();
            	return false;
            }
           
            $.ajax({
                url:'detail',
                method:'post',
                data:{price : $('[name="bid_amount"]').val(), pk :  auction_id, uid: account,id: currentid },
                success:function(){                
                        toastr.success("Bid successfully submited");
                        location.reload();
                }
            });
        });
    $('#cancel_bid').click(function(){
    	$('#bid').show();
    	$('#bid-frm').hide();
    })
    
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