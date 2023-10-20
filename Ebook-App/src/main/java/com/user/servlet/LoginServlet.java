package com.user.servlet;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.apache.commons.codec.digest.DigestUtils;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.user;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			String email=req.getParameter("email");
			String password=req.getParameter("pass");
			//String hashedPassword = DigestUtils.md5Hex(password);
			 String hashedPassword = hashPassword(password);

			
			
			if("admin@gmail.com".equals(email) && "admin".equals(password))
			{
				
				user us=new user();
				us.setName("Admin");
				session.setAttribute("userobj",us);
			

				resp.sendRedirect("admin/home.jsp");
				
			}else {
				user us =dao.login(email, hashedPassword);
				if(us!=null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
					
					
				}else {
					session.setAttribute("failedMsg","Email &Password is invald");
					resp.sendRedirect("login.jsp");
				}
				
				
				resp.sendRedirect("home.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	  private String hashPassword(String password) throws NoSuchAlgorithmException {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        byte[] hashBytes = md.digest(password.getBytes());
	        StringBuilder sb = new StringBuilder();
	        for (byte b : hashBytes) {
	            sb.append(String.format("%02x", b));
	        }
	        return sb.toString();
	    }

}
