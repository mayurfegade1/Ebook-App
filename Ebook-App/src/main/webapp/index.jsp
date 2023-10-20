<%@page import="com.entity.user"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Index</title>
<%@include file="allcomponent/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/qw.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%
	user u = (user) session.getAttribute("userobj");
	%>

	<%@ include file="allcomponent/navbar.jsp"%>
	<div class="container-fluid back-img ">
		<h1 class="text-center text-danger  ">EBook management System</h1>
	</div>

	<!--  start Recent Book -->
	<div class="container">
		<h3 class="text-center mt-2 ">Recent Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						 <%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
									<%
						if(u==null){     %>     
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<% }else{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<%	
						}
						%>

							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ">Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%> 
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
						<%
						if(u==null){     %>     
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<% }else{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<%	
						}
						%>
							
							 <a
								href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">Details</a> 
								
								<a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>

			<%
			}
			%>



		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btb btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!--End recent book  .-->
	<hr>
	<!--  start New Book -->

	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
						<%
						if(u==null){     %>     
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<% }else{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<%	
						}
						%>
							
							 <a	href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>

			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btb btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!--End New book  .-->
	<hr>
	<!--  start old Book -->
	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 180px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>

						<div class="row">
						<%
						if(u==null){     %>     
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<% }else{%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
						<%	
						}
						%>
							
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ">Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!--End old book-->
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>