<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl for secure page  -->
<%@page isELIgnored="false"%><!-- jstl for secure page  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<%@include file="allcss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	
<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">
		<div class="row p-5">
			<a href="add_books.jsp">
				<div class="col-md-3">
					<div class="card">
						<div class=" card-body">
							<i class="fa-solid fa-plus-square fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							--------------------
						</div>
					</div>
			</a>
		</div>

		<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class=" card-body">
						<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
						<h4>ALL Books</h4>
						------------------
					</div>
				</div>
			</a>
		</div>

		<div class="col-md-3">
			<a href="order_books.jsp">
				<div class="card">

					<div class=" card-body">
						<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
						<h4>Order Books</h4>
						---------------------
					</div>
				</div>
			</a>
		</div>

		<div class="col-md-3">
		<a data-toggle="modal" data-target="#exampleModalCenter">
			<div class="card">

				<div class=" card-body">
					<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
					<h4>Logout</h4>
					------------------
				</div>
			</div>
			</a>
		</div>

	</div>

	</div>
	  
	  <!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do You want to logout</h4>

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../Logout" type="button" class="btn btn-primary text-white">logout</a>


				</div>


			</div>


			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- end of logout modal-->
	  
	<div style="margin-top:350px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>