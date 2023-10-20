<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: all orders</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<h3 class="text-center">Hello Admin</h3>
	<table class="table table-striped">
		<thead class="bg-primary text-white ">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">mono</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		
		<%
		BookOrderImpl dao =new BookOrderImpl(DBConnect.getConn());
		List<Book_Order>blist=dao.getAllOrder();
		for(Book_Order b:blist){%>
			
			<tr>
				<th scope="row"><%=b.getOrder_id() %></th>
				<td><%=b.getUsername() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladdress() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
			</tr>
			
		<% }
		
		%>
		
			
		</tbody>
	</table>
	<div style="margin-top:270px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>