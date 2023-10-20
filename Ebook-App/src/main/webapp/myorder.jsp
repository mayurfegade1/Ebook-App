s<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myorder</title>

<%@include file="allcomponent/allcss.jsp"%>	

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
		
						<h5 class="text-center text-success">Your Order</h5>
						<table class="table table-striped  mt-5">
							<thead class="bg-primary text-white">
								<tr>
									<th scope="col">Order Id</th>
									<th scope="col">Name</th>
									<th scope="col">Book NAme</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Payment Mode</th>
								</tr>
							</thead>
							<tbody>
							<%
						user u=(user)session.getAttribute("userobj");
							BookOrderImpl dao =new BookOrderImpl(DBConnect.getConn());
							List<Book_Order> blist=dao.getBook(u.getEmail());
							for(Book_Order b:blist){ 
								%>
								
								<tr>
									<th scope="row"><%=b.getOrder_id()%></th>
									<td><%=b.getUsername() %></td>
									<td><%=b.getBookName() %></td>
									<td><%=b.getAuthor() %></td>
									<td><%=b.getPrice()%></td>
									<td><%=b.getPaymentType() %></td>
								</tr>
								
							<%	
							}
							
							%>
							
							
							</tbody>
						</table>
					</div>
			

</body>
</html>