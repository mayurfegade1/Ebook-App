/**
 * 
 */
package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.user;

/**
 * @author mayur
 *
 */
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String hashedPassword=req.getParameter("pass");
			String password = DigestUtils.md5Hex(hashedPassword);
			
			user us=new user();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setMono(phno);
			
			HttpSession session=req.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f= dao.checkPassword(id, password);
			if(f) {
				boolean f2=dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succMsg","User profile update Sucess..");
					resp.sendRedirect("edit_profile.jsp");
			
					
				} else {
					session.setAttribute("failedMsg","user profile not update ");
					resp.sendRedirect("edit_profile.jsp");
			
				}
			}else {
				session.setAttribute("failedMsg","your password incorrect");
				resp.sendRedirect("edit_profile.jsp");
		
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

}
	}
