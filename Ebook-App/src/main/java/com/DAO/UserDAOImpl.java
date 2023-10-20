package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.user;
import com.mysql.cj.protocol.Resultset;

import at.favre.lib.crypto.bcrypt.BCrypt.Result;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn= conn;
	}

	@Override
	public boolean userRegister(user us) {
		boolean f=false;
		try {
			String sql="insert into user(name,email,mono,password) values (?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getMono());
			ps.setString(4,us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		return f;
	}

	@Override
	public user login (String email, String password) {
		// TODO Auto-generated method stub
		user us=null;
		
		try {
			String sql="select * from user where email=? and password=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				us=new user();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setMono(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return us; 
	
	}

	@Override
	public boolean checkPassword(int id,String ps) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="select * from user where id=? and password=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,id);	
			pst.setString(2,ps);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				
				
				f=true;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	@Override
	public boolean updateProfile(user us) {
		boolean f=false;
		try {
			String sql="update user set name=?,email=?,mono=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getMono());
			//ps.setString(4,us.getPassword());
			ps.setInt(4, us.getId());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		return f;
	}

	/*
	 * @Override public boolean deleteBook(int bid, int uid, int cid) { // TODO
	 * Auto-generated method stub return false; }
	 */
	@Override
	public boolean checkuser(String em) {
		boolean f=true;
		try {
			String sql="select * from user where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,em);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				f=false;
				
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		return f;
	}
	
}
