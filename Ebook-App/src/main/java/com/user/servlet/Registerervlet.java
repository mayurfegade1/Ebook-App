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
import org.apache.commons.codec.digest.DigestUtils;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.user;
import org.mindrot.jbcrypt.BCrypt;
//import org.mindrot.jbcrypt.BCrypt;
@WebServlet("/register")
public class Registerervlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String mono=req.getParameter("mono");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			
	        String hashedPassword = hashPassword(password);

	//String hashedPassword = DigestUtils.md5Hex(password);//
		
	        
	        
	        //	String hashedPassword = org.mindrot.jbcrypt.BCrypt.hashpw(password, BCrypt.gensalt());
			//System.out.println(name+""+email+""+mono+""+password+""+check);  
			user us=new user(); 
			us.setName(name);
			us.setEmail(email);
			us.setMono(mono);
			us.setPassword(hashedPassword);
			HttpSession session=req.getSession();
			if(check!=null) {
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				boolean f2=dao.checkuser(email);
				if(f2) {
					boolean f=dao.userRegister(us);
					if(f){
						//System.out.println("User Register Sucess");
						session.setAttribute("succMsg","User Registration Sucess..");
						resp.sendRedirect("login.jsp");
					}else {
						//System.out.println("Something wrong on server ");
						session.setAttribute("failedMsg","Something wrong on server");
						resp.sendRedirect("register.jsp");
					}
					
				}else {
					session.setAttribute("failedMsg","User Alredy registered with this email  Try Another Email");
					resp.sendRedirect("register.jsp");
					
				}
			}else {
				//System.out.println("Please check Agree & Terms Codition");
				session.setAttribute("failedMsg","Please check Agree & Terms Codition");
				resp.sendRedirect("register.jsp");
			}
			
			
				
			
		} catch (Exception e) {
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
