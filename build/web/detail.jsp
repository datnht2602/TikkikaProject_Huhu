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
     <c:set var="currentId">${list.getId()}</c:set>
     <c:set var="currentcategory">${list.getCategory_id()}</c:set>
     
    <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="${list.getImg_fname()}" alt="Image">
                        </div>
                       
                     
                        
                    </div>
                  
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30">
                <div class="h-100 bg-light p-30">
                    <h3>${list.getName()}</h3>
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
                                                                                                    <c:forEach items="${bidding}" var="bidding1">
                                                                                                 <c:if test="${bidding1.getProduct_id()==currentId}">
                                                                                                     <c:set  var="highestAmount">${bidding1.getBid_amout()}</c:set>
                                                                                                      <c:set  var="currentbidding">${bidding1.getUser_id()}</c:set>
                                                                                                      <c:set  var="currentid">${bidding1.getId()}</c:set>
                                                                                                 </c:if>                                                                                               
                                                                                             </c:forEach>
      
  
                   <p>Highest Bid: <b id="hbid">${list.getStart_bid()}</b></p>
                      <p class="mb-4"> Gia Khoi Diem : ${list.getStart_bid()}</p>
                         <c:forEach items="${category}" var="category1">
                                                                                                 <c:if test="${category1.getId()==currentcategory}">
                                                                                                     <c:set var="nameCategory">${category1.getName()}</c:set>
                                                                                                 </c:if>                                                                                               
                                                                                             </c:forEach>
                        <p class="mb-4"> The Loai : ${nameCategory}</p>
                         <p class="mb-4"> Han cuoi  : ${list.getBid_end_datetime()}</p>
                         <p class="mb-4">${list.getDescription()}</p>
                    
                   
                     <form action="UpdateProductServlet" method="POST">
                            <div class="input-group">
                                
                                <input name="id" type="hidden" value="${list.getId()}" class="form-control" placeholder="">
                                <div class="col-md-12">
		<button class="btn btn-primary btn-block btn-sm" type="button" id="bid">Bid</button>
	</div>
                            </div>
                        </form>
                 
                </div>
            </div>
        </div>
    
    </div>
    	<div id="bid-frm">
		<div class="col-md-12">
			<form id="manage-bid">				
                                <input type="hidden" id="account" value="${uid.getuID()}">
                                 <input type="hidden" id="currentuid" value="${currentbidding}">
                                 <input type="hidden" id="auction_id" value="${list.getId()}">
                                   <input type="hidden" id="currentid" value="${currentid}">
				<div class="form-group">
					<label for="" class="control-label">Bid Amount</label>
					<input type="number" class="form-control text-right" name="bid_amount" >
				</div>
				<div class="row justify-content-between">
					<button class="btn col-sm-5 btn-primary btn-block btn-sm mr-2">Submit</button>
					<button class="btn col-sm-5 btn-secondary mt-0 btn-block btn-sm" type="button" id="cancel_bid">Cancel</button>
				</div>
			</form>
		</div>
	</div>


    <!-- Products Start -->
    <div class="container-fluid py-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">You May Also Like</span></h2>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/product-1.jpg" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small>(99)</small>
                            </div>
                        </div>
                    </div>
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/product-2.jpg" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small>(99)</small>
                            </div>
                        </div>
                    </div>
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/product-3.jpg" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small>(99)</small>
                            </div>
                        </div>
                    </div>
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/product-4.jpg" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small>(99)</small>
                            </div>
                        </div>
                    </div>
                    <div class="product-item bg-light">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/product-5.jpg" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small>(99)</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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