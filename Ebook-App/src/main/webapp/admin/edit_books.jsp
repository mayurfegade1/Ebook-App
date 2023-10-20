<%@page import="java.lang.foreign.Linker.Option"%>
<%@page import="com.entity.BookDtls"%>
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
<title>addbooks</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">

	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-5">
				<div classs="card">
					<div class="card-body">

						<h4 class="text-center">Edit Books</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>




						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>" required>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>" required>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getPrice()%>" required>

							</div>

							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Status</label> <select
									class="form-control" name="bstatus"
									id="exampleFormControlSelect1">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>
									<%
									} else {
									%>

									<option value="InActive">InActive</option>
									<option value="Active">Active</option>
									<%
									}
									%>

								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
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