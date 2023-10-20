<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  <!-- jstl for secure page  -->
<%@page isELIgnored="false"%>        <!-- jstl for secure page  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setting</title>
<%@include file="allcomponent/allcss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>


</head>
<body style="background-color: #f7f7f7;">

<c:if test="${ empty userobj }">
		<!--  here we use jstl logic to secure the page if user is not login then he will not able to access this page  -->
		<c:redirect url="login.jsp">
		</c:redirect>
		<!-- if user is not login then he will redirected to login page -->
	</c:if>
	<%@ include file="allcomponent/navbar.jsp"%>

	<div class="container">
	
	
	<h3 class="text-center">Hello,${userobj.name }</h3>
	
		
		<div class="row p-5">
			<div class="col-md-4 mt-3">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-2x"></i>
							</div>

							<h3>sell old books</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-2x"></i>
							</div>

							<h3> old books</h3>
						</div>
					</div>
				</a>
			</div>
			 <div class="col-md-4 mt-3 ">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>

							<h4>Edit profile</h4>
						</div>
					</div>
				</a>
			</div>
			
		
			<div class="col-md-6 mt-3">
				<a href="myorder.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>

							<h4>my order</h4>
							<p>Track My Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="helplines.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>

							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>