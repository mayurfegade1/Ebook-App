<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl for secure page  -->
<%@page isELIgnored="false"%><!-- jstl for secure page  -->

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>sellbook</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>

</c:if>

	<%@ include file="allcomponent/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2">
					<div class="card-body">
						<h5 class="text-center text-primary">Sell Old Book</h5>
						<c:if test="${not empty succsMsg}">
							<p class="text-center text-success">${succsMsg}</p>
							<c:remove var="succsMsg" scope="session"/>
						
						</c:if>
						
						
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						
						</c:if>
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">



							<input type="hidden" value="${userobj.email}" name="user"><!-- after login user informatin will
						 go into the session so we retrive user email from seesion to store old book details used in add old book. type is hidden so it is not showing to see set type as text in input tag-->
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>

							</div>


							<div class="form-group">
								<label for="exampleFormControlSelect1">upload photo</label> <input
									type="file" class="form-control" name="bimg"
									id="exampleInputEmail1" required>
							</div>


							<button type="submit" class="btn btn-primary">sell</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>