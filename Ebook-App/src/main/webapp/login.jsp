<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="styles.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body style="background-color: #7d2ae8;">

	<div class="container">
		<input type="checkbox" id="flip">
		<div class="cover">
			<div class="front">
				<img src="Images/frontImg.jpg" alt="">
				<div class="text">
					<span class="text-1">Every new friend is a <br> new
						adventure
					</span> <span class="text-2">Let's get connected</span>
				</div>
			</div>
			<div class="back">
				<img class="backImg" src="Images/backImg.jpg" alt="">
				<div class="text">
					<span class="text-1">Complete miles of journey <br>
						with one step
					</span> <span class="text-2">Let's get started</span>
				</div>
			</div>
		</div>
		<div class="forms">
			<div class="form-content">
					
				<div class="login-form">
				<button  class="btn" onclick="window.location.href='index.jsp';"><i class="fa fa-home"></i> Home</button>
					<div class="title">Login</div>
				
					<c:if test="${not empty failedMsg }">
						<h1 class="text-center text" style="color:red">${failedMsg}</h1>
						<c:remove var="failedMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg }">
						<h1 class="text-center text" style="color:green">${succMsg}</h1>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<form action="login" method="post">

						<div class="input-boxes">
							<div class="input-box">
								<i class="fas fa-envelope"></i> <input type="text" name="email"
									placeholder="Enter your email" required>
							</div>
							<div class="input-box">
								<i class="fas fa-lock"></i> <input type="password" name="pass"
									placeholder="Enter your password" required>
							</div>
							<div class="text">
								<a href="#">Forgot password?</a>
							</div>
							<div class="button input-box">
								<input name="btn2" type="submit" value="login" >
							</div>
							<div class="text sign-up-text">
								Don't have an account? <label for="flip">Sigup now</label>
							</div>
						</div>
					</form>
				</div>


				<div class="signup-form">
<button  class="btn" onclick="window.location.href='index.jsp';"><i class="fa fa-home"></i> Home</button>
					<div class="title">Signup</div>

					<c:if test="${not empty succMsg    }">
						<p class="text-center text" style="color:green">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<c:if test="${not empty failedMsg }">
						<p class="text-center text" style="color:red">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

					<form action="register" method="post">
						<div class="input-boxes">
							<div class="input-box">
								<i class="fas fa-user"></i> <input type="text"
									placeholder="Enter your name" required="required" name="fname">
							</div>
							<div class="input-box">
								<i class="fas fa-envelope"></i> <input type="text"
									placeholder="Enter your email" required="required" name="email">
							</div>
							<div class="input-box">
								<i class="fas fa-envelope"></i> <input type="text"
									placeholder="Enter your mobile no" required="required"
									name="mono">
							</div>
							<div class="input-box">
								<i class="fas fa-lock"></i> <input type="password"
									placeholder="Enter your password" required="required"
									name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & Conditions</label>
							</div>
							<div class="button input-box">
								<input name="btnsub" type="submit" value="Sumbit" for="flip">
							</div>

							<div class="text sign-up-text">
								Already have an account? <label for="flip">Login now</label>
							</div>
						</div>
					</form>
				</div>


			</div>

		</div>
	</div>
 



</body>
</html>
