<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editprofile</title>
<%@include file="allcomponent/allcss.jsp"%>





</head>
<body style="background-color: #f0f2f2;">

	<%@ include file="allcomponent/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2">
				<div class="card-body">
				<h5 class="text-center text-primary">Edit Profile</h5>
				<c:if test="${not empty succMsg }">
						<p class="text-center text" style="color:green">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<c:if test="${not empty failedMsg }">
						<p class="text-center text" style="color:red">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>
				
				<form action="update_profile" method="post">
				
				 <input type="hidden" value="${userobj.id }" name="id">
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Full Name</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" required="required" name="name" value="${userobj.name}">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" required="required"  name="email" value="${userobj.email }">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Phone No</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter phone No" name="phno" value="${userobj.mono }">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">password</label> <input
								type="password" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="enter correct password" name="pass" >
							
						</div>
						
						<button type="submit" class="btn btn-primary btn-block btn-sm" >Update</button>
					</form>
				
					</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>