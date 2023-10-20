<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl code for secure page if user not login then not able to access page  -->
<%@page isELIgnored="false"%><!-- jstl for secure page  -->
<!--  cart module page -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart page</title>
<%@include file="allcomponent/allcss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">


	<%@include file="allcomponent/navbar.jsp"%>

	<c:if test="${ empty userobj }">
		<!--  here we use jstl logic to secure the page if user is not login then he will not able to access this page  -->
		<c:redirect url="login.jsp">
		</c:redirect>
		<!-- if user is not login then he will redirected to login page -->
	</c:if>
	<c:if test="${not empty succMsg }">

		<div class="alert alert-success" role="alert">${succMsg }</div>
			<c:remove var="succMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedMsg }">

		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
			<c:remove var="failedMsg" scope="session"/>
	</c:if>


	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">


				<div class="card bg-white">
					<div class="card-body">

						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								user u = (user) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice=0.00;
								for (Cart c : cart) {
									totalPrice=c.getTotalprice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid() %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice %></td>
								</tr>

							</tbody>
						</table>

					</div>
				</div>


			</div>

			<div class="col-md-6">

				<div class="card">
					<div class="card-body">

						<h3 class="text-center text-success">Your Details for order</h3>

						<form action ="order" method="post">
						
						<input type="hidden" value="${userobj.id }"name="id" >
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" value="<%=u.getName()%>" name="username" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" value="<%=u.getEmail() %>" name="email" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">phone number</label> <input
										type="number" class="form-control" id="inputEmail4" value="<%=u.getMono()%>" name="phno" required >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" name="address" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" value="" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">city</label> <input type="text"
										class="form-control" id="inputPassword4" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" value="" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">pin code</label> <input
										type="number" class="form-control" id="inputPassword4" name="pincode" required>
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control" name="paymenttype">
									<option value="noselect">--select</option>
									<option value="online">online</option>
									<option value="cod">cash on Delivery</option>

								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning" id="ordernow">order now</button>
								<a href="index.jsp" class="btn btn-success"> Continue
									Shopping</a>
							</div>




						</form>

					</div>
				</div>


			</div>
		</div>


	</div>



	

 <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
    document.getElementById("ordernow").addEventListener("click", function () {
        const amount = document.getElementById("totalPrice").value;

        // Replace with your Razorpay API Key
        const razorpayApiKey = 'YOUR_RAZORPAY_API_KEY';

        fetch("/create-order", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                amount: amount * 100, // Convert to paise (Indian currency)
            }),
        })
        .then((response) => response.json())
        .then((data) => {
            const options = {
                key: razorpayApiKey,
                amount: data.amount,
                currency: "INR",
                name: "Your Company Name",
                description: "Payment for Services",
                order_id: data.id,
                handler: function (response) {
                    alert("Payment Successful. Payment ID: " + response.razorpay_payment_id);
                },
                prefill: {
                    name: "username",
                    email: "email",
                },
            };
            const rzp = new Razorpay(options);
            rzp.on("payment.failed", function (response) {
                alert("Payment Failed");
            });
            rzp.open();
        })
        .catch((error) => {
            console.error("Error creating order:", error);
        });
    });

    </script>



</body>
</html>