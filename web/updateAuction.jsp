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
      
	<div class="row"
			style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
			<div class="col-sm-12">				
				<h2>Sua San Pham</h2>
				<form action="UpdateAuctionServlet" method="POST">
					<div class="form-group">
						<label>name</label> 
						<input type="text" name="name" class="form-control" placeholder="Enter UserName" value="${result.getName()}">
                                                
					</div>
                                                                  	<div class="form-group">
								<label>category</label> 
                                                                <div>
                                                                    <select name="category" >
  <c:forEach var="dept" items="${category}" >
            <option value="${dept.getId()}" ${dept.getId()== result.getCategory_id() ? "selected":""}>${dept.getName()}</option>
        </c:forEach>
</select>
                                                                </div>
                                        </div>
                                                  <div class="form-group">
						<label>description</label> 
						<input type="text" name="description" class="form-control" placeholder="Enter description" value="${result.getDescription()}">
                                        </div>
                                    <div class="form-group">
						<label>Regular price</label> 
						<input type="number" name="regular_price" class="form-control" placeholder="Enter Price" value="${result.getRegular_price()}">
                                        </div>
                                        
                                         <div class="form-group">
						<label>Starting Bidding Amount</label> 
						<input type="number" name="start_bid" class="form-control" placeholder="Enter Price" value="${result.getStart_bid()}">
                                        </div> 
                                        
                               <div class="form-group">
						<label>photo</label> 
						<input type="text" name="image" class="form-control" placeholder="Enter description" value="${result.getImg_fname()}">
                                                <img src="${result.getImg_fname()}" width="250" height="200">
                                        </div> 
      
                                         <div class="form-group">
					<label for="birthdaytime">End Date/time</label>
                                        <input type="datetime-local" id="birthdaytime" name="birthdaytime" value="">
                                        </div>
					<button type="submit" class="btn btn-primary">Save</button>
                                          <a class="btn btn-primary" href="DisplayServlet">Cancel</a>
				</form>
			</div>
		</div>
	</div>
<!-- Modal 
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
</div>-->



    <!-- Footer Start -->
    <%@include file="footer/footer.jsp" %>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

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