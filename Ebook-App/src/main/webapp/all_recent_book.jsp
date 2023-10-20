<%@page import="com.entity.user"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all_recent_book</title>
<%@include file="allcomponent/allcss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body>
<%
	user u = (user) session.getAttribute("userobj");
	%>
	<%@ include file="allcomponent/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row-center">

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2">Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row-center">
							<%
							if (u==null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping mr-1"></i>Add cart</a>
							<%
							}
							%>
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2">Details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
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

	</div>

</body>
</html>