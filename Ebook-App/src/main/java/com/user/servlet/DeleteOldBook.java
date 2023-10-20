


	package com.user.servlet;

	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

	import com.DAO.BookDAOImpl;
	import com.DB.DBConnect;
	@WebServlet("/delete_old_book")
	//@SuppressWarnings("serial")
	public class DeleteOldBook extends HttpServlet{

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			int bookid=Integer.parseInt(req.getParameter("bookid"));
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			 
			boolean f=dao.olddeleteBooks(email,"Old", bookid); 
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg","Book Removed successfully");
				resp.sendRedirect("old_book.jsp");
				
			}else {
				session.setAttribute("succMsg","Book not Removed");
				resp.sendRedirect("old_book.jsp");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		}
		

	}
