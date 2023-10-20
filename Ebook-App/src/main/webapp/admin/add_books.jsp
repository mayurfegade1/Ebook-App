<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addbooks</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">

	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-5">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Add Books</h4>
						
						<c:if test="${not empty succsMsg}">
							<p class="text-center text-success">${succsMsg}</p>
							<c:remove var="succsMsg" scope="session"/>
						
						</c:if>
						
						
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						
						</c:if>
						
						
						
						
						
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
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
								<label for="exampleFormControlSelect1">Book categories</label> <select
									class="form-control" name="Category"
									id="exampleFormControlSelect1" required>
									<option selected>---select---</option>
									<option value="New">New Book</option>

								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Status</label> <select
									class="form-control" name="bstatus"
									id="exampleFormControlSelect1" required>
									<option selected>---select---</option>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>
								</select> 
							</div>

							<div class="form-group">
								<label for="exampleFormControlSelect1">upload photo</label> <input
									type="file" class="form-control" name="bimg"
									id="exampleInputEmail1" required>
							</div>


							<button type="submit" class="btn btn-primary">Add</button>
						</form>



					</div>
				</div>

			</div>


		</div>


	</div>
	<div style="margin-top: 40px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>