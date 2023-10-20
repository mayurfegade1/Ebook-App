
<!-- used this page to remove old book from setting -->



<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl code for secure page if user not login then not able to access page  -->
<%@page isELIgnored="false"%><!-- jstl for secure page  -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
<%@ include file="allcomponent/navbar.jsp"%>
<div class="container p-5">

					<c:if test="${not empty succMsg }">
						<div class="alert alert-success text-center">${succMsg}</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">price</th>
      <th scope="col">Category</th>
       <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
		user us=(user)session.getAttribute("userobj");
		String email=us.getEmail();
  BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
  //dao.getBookByOld(email,"Old");
  List<BookDtls> list=dao.getBookByOld(email,"Old");
  for(BookDtls b:list){
	  %>
	  
	 <tr> 
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory()%></td>
      <td><a href="delete_old_book?email=<%=email %>&&bookid=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
    </tr>
  <%}
  
  %>
    
   
    
  </tbody>
</table>
</div>
	
</body>
</html>