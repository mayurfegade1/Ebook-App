package com.DAO;

import org.apache.catalina.User;

import com.entity.user;

public interface UserDAO {
  public boolean userRegister(user us);
  
  public  user login(String email,String password);
  public boolean checkPassword(int id,String ps );
  
  public boolean updateProfile(user us);
  
 // public boolean deleteBook(int bid,int uid,int cid);
  public boolean checkuser(String em);
}
