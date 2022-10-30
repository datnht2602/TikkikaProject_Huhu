<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"">
    <title>MultiShop - Online Shop Website Template</title>
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
    <!-- Navbar End -->


    <div class="container-fluid pt-5 pb-3">
        	<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>List of Bids</b>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="">Name</th>
									<th class="">Product</th>
									<th class="">Amount</th>
									<th class="">Status</th>
									<th class=""></th>
								</tr>
							</thead>
							<tbody>
                                                            <c:forEach items="${list}" var="dto" varStatus="loop"  >
                                                                <c:set var="currenttime">${dto.getBdt()}</c:set>
                                                                <c:set var="currentpid">${dto.getProduct_id()}</c:set>
                                                                <c:set var="currentuid">${dto.getUser_id()}</c:set>
                                                                
								<tr>
									<td class="text-center">${loop.count}</td>
									<td class="">
										 <p> <b>${dto.getUname()}
                                                                                   </b></p>
									</td>
									<td class="">
										 <p> <b>${dto.getName()}</b></p>
									</td>
									<td class="text-right">
										 <p> <b>${dto.getBid_amount()}</b></p>
									</td>
									<td class="text-center">
                                                                                <c:choose>
                                                                            <c:when test="${dto.getStatus()==1}">
                                                                                 <c:choose>
                                                                                     <c:when test="${dto.getBdt()==1}">
                                                                                           <span class="badge badge-secondary">Bidding Stage</span>
                                                                                     </c:when>
                                                                                  <c:otherwise>
                                                                                          <c:forEach items="${bidding}" var="bidding1">
                                                                                              <c:if test="${bidding1.getProduct_id()==currentpid}">
                                                                                                     <c:set var="user_id">${bidding1.getUser_id()}</c:set>
                                                                                                 </c:if>                                                                                                                                                                                                                                                                                     
                                                                                             </c:forEach>
                                                                                           <c:choose>
                                                                                                    <c:when test ="${user_id==currentuid}">
                                                                                              
                                                                                                  <span class="badge badge-success">Wins in Bidding</span>
                                                                                              </c:when>
                                                                                                   <c:otherwise>                                                                                                  
                                                                                       <span class="badge badge-secondary">Loose in Bidding</span>
                                                                                    </c:otherwise> 
                                                                                              </c:choose>
                                                                                    </c:otherwise>
                                                                                        </c:choose>                                                                            
                                                                                    </c:when>
                                                                                    <c:when test="${dto.getStatus()==2}">
                                                                                         <span class="badge badge-primary">Confirmed</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                      	<span class="badge badge-danger">Canceled</span>
                                                                                    </c:otherwise>
                                                                                  </c:choose>
									</td>
									<td>
										<button class="btn btn-primary btn-sm view_user" type="button" data-id ='${dto.getUser_id()}'>View Buyer Details</button>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
    </div>
 
    <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <h5 class="text-secondary text-uppercase mb-4">Cho Tikkika</h5>
                <p class="mb-4">Muc dich tao ra cho ban kenh mua ban, ket noi nguoi mua, nguoi ban lai voi nhau</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>FPT Uni</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@fpt.edu.vn</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">

                    <div class="col-md-4 mb-5">

                        <h6 class="text-secondary text-uppercase mt-4 mb-3">Theo Doi</h6>
                        <div class="d-flex">
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<div class="modal fade" id="confirm_modal" role='dialog'>
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title">Confirmation</h5>
      </div>
      <div class="modal-body">
        <div id="delete_content"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id='confirm' onclick="">Continue</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="uni_modal" role='dialog'>
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title"></h5>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="viewer_modal" role='dialog'>
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
              <button type="button" class="btn-close" data-dismiss="modal"><span class="fa fa-times"></span></button>
              <img src="" alt="">
      </div>
    </div>
  </div>   


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
<script>
    	 window.start_load = function(){
    $('body').prepend('<di id="preloader2"></di>')
  }
  window.end_load = function(){
    $('#preloader2').fadeOut('fast', function() {
        $(this).remove();
      })
  }
    window.uni_modal = function($title = '' , $url='',$size=""){
    start_load()
    $.ajax({
        url:$url,
        error:err=>{
            console.log()
            alert("An error occured")
        },
        success:function(resp){
            if(resp){
                $('#uni_modal .modal-title').html($title)
                $('#uni_modal .modal-body').html(resp)
                if($size != ''){
                    $('#uni_modal .modal-dialog').addClass($size)
                }else{
                    $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md")
                }
                $('#uni_modal').modal({
                  show:true,
                  backdrop:'static',
                  keyboard:false,
                  focus:true
                })
                end_load()
            }
        }
    })
}
	
	
             $(document).ready(function(){        
        $('.view_user').click(function(){
		uni_modal("<i class'fa fa-card-id'></i> Buyer Details","view_udet.jsp?id="+$(this).attr('data-id'));
		
	});
        });
	
</script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>