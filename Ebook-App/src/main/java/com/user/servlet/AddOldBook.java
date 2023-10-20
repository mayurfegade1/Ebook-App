package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet  {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String Category = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			
			String useremail=req.getParameter("user");// here user is name from sell_book page . used to store sell old book info
			
			BookDtls b = new BookDtls(bookName, author, price, Category, status, fileName, useremail);
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

			int f = dao.addBooks(b);
			HttpSession session = req.getSession();

			if (f == 1) {
				String path = getServletContext().getRealPath("") + "book";
				File file = new File(path);

				part.write(path + File.separator + fileName);

				session.setAttribute("succsMsg", "Book Add Successfully");
				resp.sendRedirect("sell_book.jsp");
			} else {
				session.setAttribute("failedMsg", "something wrong on server");
				resp.sendRedirect("sell_book.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

