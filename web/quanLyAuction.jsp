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
    <meta charset="UTF-8" />
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

    <div class="container-fluid pt-5 pb-3">
        	<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>List of Products</b>
						<span class="float:right"><a class="btn btn-primary btn-block btn-sm col-sm-2 float-right" href="AddAuctionProductServlet" id="new_product">
					<i class="fa fa-plus"></i> New Entry
				</a></span>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="">Img</th>
									<th class="">Category</th>
									<th class="">Product</th>
									<th class="">Other Info</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
							
                                                                <c:forEach items="${list}" var="dto" varStatus="loop"  >
                                                                       <c:set var="currentId">${dto.getId()}</c:set>
                                                                       <c:set var="currentcategory">${dto.getCategory_id()}</c:set>
								<tr data-id= '${dto.getId()}'>
									<td class="text-center">${loop.count}</td>
									<td class="">
										
										 	<img src="${dto.getImg_fname()}" alt="" width="200" height="300">
										
									</td>
									<td>
										 <p> <b> <c:forEach items="${category}" var="category1">
                                                                                                 <c:if test="${category1.getId()==currentcategory}">
                                                                                                     <c:set var="nameCategory">${category1.getName()}</c:set>
                                                                                                 </c:if>                                                                                               
                                                                                             </c:forEach>
                                                                                         ${nameCategory}
      </b></p>
									</td>
									<td class="">
										 <p>Name: <b>${dto.getName()}</b></p>
										 <p><small>Description: <b>${dto.getDescription()}</b></small></p>
									</td>
									<td>
										 <p><small>Regular Price: <b>${dto.getRegular_price()}</b></small></p>
										 <p><small>Start Price: <b>${dto.getStart_bid()}</b></small></p>
										 <p><small>End Date/Time: <b>${dto.getBid_end_datetime()}</b></small></p>
                                                                               
										 <p><small>Highest Bid: <b class="highest_bid">
                                                                                             <c:forEach items="${bidding}" var="bidding1">
                                                                                                 <c:if test="${bidding1.getProduct_id()==currentId}">
                                                                                                     <c:set var="highestAmount">${bidding1.getBid_amout()}</c:set>
                                                                                                 </c:if>                                                                                               
                                                                                             </c:forEach>
  ${highestAmount}
  </b></small></p>
										 <p><small>Total Bids: <b class="total_bid">                          
                                                                        <%
                                                                   String resp2 = (String)pageContext.getAttribute("currentId"); 
                                                                int count = dao.getTotalBidUsers(resp2);
    out.println(count);
  %> </b></small></p>
									</td>
									<td class="text-center">
										<button class="btn btn-sm btn-outline-primary edit_product" type="button" data-id="${dto.getId()}" >Edit</button>
                                                                                |
										 <button type="button" data-id="${dto.getId()}"  class="btn btn-danger callModal" data-bs-toggle="modal" data-bs-target="#delete"> Delete</button>
									</td>
								</tr>
                                                                </c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
    </div>
    <!-- Modal -->
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        
        <h5 class="modal-title" id="exampleModalLabel">Thong Bao</h5>
         
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Ban Co That Su Muon Xoa
      </div>
        <input type="hidden" id="category_id">
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huy Bo</button>
        <button type="button" id="deleteCate" class="btn btn-primary">Co</button>
      </div>
    </div>
  </div>
</div>
    <!-- Products End -->


    <!-- Vendor Start -->
    <!-- Vendor End -->


    <!-- Footer Start -->
 <%@include file="footer/footer.jsp" %>

    <!-- Footer End -->
   <script>
          $(document).ready(function(){        
              var row;
                  $(".callModal").click(function(){
            var id = $(this).data('id');
            console.log("Chuan bi xoa san pham id : " + id);
             row = $(this);
            $("#category_id").val(id);
        });
       $('.edit_product').click(function(){
		location.href ="UpdateAuctionServlet?id="+$(this).attr('data-id');
		
	});
          $("#deleteCate").click(function(){
            var pk = $("#category_id").val();
            $.ajax({
                 type: "GET",
                                url : "DeleteAuctionServlet",
                                data: {pk: pk},
               success: function(){
                   toastr.success("Deleted successfully");
                  $(row).closest('tr').remove();
                    $('#delete').modal('hide');
               }
            });
        });
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