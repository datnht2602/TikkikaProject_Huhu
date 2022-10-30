<%-- 
    Document   : view_udet
    Created on : Oct 19, 2022, 4:00:00 PM
    Author     : Derek
--%>
<%@page import="entity.AccountDTO"%>
<%@page import="dao.DAO"%>
<%
      String id = request.getParameter("id");
      int uid = Integer.parseInt(id);
      DAO dao = new DAO();
      AccountDTO result = dao.searchAccount(uid);
      request.setAttribute("uid", result);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <style type="text/css">
	
	.avatar {
	    max-width: calc(100%);
	    max-height: 27vh;
	    align-items: center;
	    justify-content: center;
	    padding: 5px;
	}
	.avatar img {
	    max-width: calc(100%);
	    max-height: 27vh;
	}
	p{
		margin:unset;
	}
	#uni_modal .modal-footer{
		display: none
	}
	#uni_modal .modal-footer.display{
		display: block
	}
</style>
<div class="container-field">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-md-6">
				<p>Name: <b>${uid.getUsername()}</b></p>
				<p>Email: <b>${uid.getEmail()}</b></p>
				<p>Contact: <b>${uid.getContact()}</b></p>
				<p>Address: <b>${uid.getAddress()}</b></p>
			</div>
		</div>
	</div>
</div>
<div class="modal-footer display">
	<div class="row">
		<div class="col-lg-12">
			<button class="btn float-right btn-secondary" type="button" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>
    </body>
</html>
