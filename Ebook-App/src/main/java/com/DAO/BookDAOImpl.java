package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {
private Connection conn;

	public BookDAOImpl(Connection conn) {
	super();
	this.conn = conn;
}
	

	@Override
	public int addBooks(BookDtls b) {
		// TODO Auto-generated method stub
		int f =0;
		try {
			String sql="insert into book_dtls(bookname,author,price,bookCategory,status,photo,useremail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setNString(1, b.getBookName());
			ps.setNString(2, b.getAuthor());
			ps.setNString(3, b.getPrice());
			ps.setNString(4, b.getBookCategory());
			ps.setNString(5, b.getStatus());
			ps.setNString(6, b.getPhotoname());
			ps.setNString(7, b.getEmail());
			int i=ps.executeUpdate();
		if(i>=1)	{
				f=1;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return f;
	}


	@Override
	public List<BookDtls> getAllBooks() {
		
		List<BookDtls> list =new ArrayList<BookDtls>();
		BookDtls b=null;
				try {
			String sql="select * from book_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public BookDtls getBookById(int id) {
		
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return b;
		
		
		
		
	}


	public boolean updateEditBooks(BookDtls b) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="update book_dtls set bookname=?,author=?,price=?,status=? where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2,b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
		
	}


	@Override
	public boolean deleteBooks(int id) {
		// TODO Auto-generated method stub
		boolean f=false;
				try {
					String sql="delete from book_dtls where bookid=?";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setInt(1,id);
					int i=ps.executeUpdate();
					if(i==1) {
						f=true;
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
		return f;
	}


	@Override
	public List<BookDtls> getNewBook() {

			List<BookDtls> list=new ArrayList<BookDtls>();
			BookDtls b=null;
			try {
				String sql="select * from book_dtls where bookCategory =? and status=? order by bookid DESC " ;
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, "New");
				ps.setString(2, "Active");
				ResultSet rs=ps.executeQuery();
				int i=1;
				while(rs.next() && i<=4)
				{
					b=new BookDtls();
					b.setBookId(rs.getInt(1));
					b.setBookName(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setBookCategory(rs.getString(5));
					b.setStatus(rs.getString(6));
					b.setPhotoname(rs.getString(7));
					b.setEmail(rs.getString(8));
					list.add(b);
					i++;
				}
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		
		
		return list;
	}


	@Override
	public List<BookDtls> getRecentBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookid DESC " ;
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	
	return list;
}


	@Override
	public List<BookDtls> getOldBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory =? and status=? order by bookid DESC " ;
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	
	return list;
	}


	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookid DESC " ;
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next() )
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	
	return list;
	}


	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory =? and status=? order by bookid DESC " ;
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	
	return list;
	}


	@Override
	public List<BookDtls> getAllOldtBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory =? and status=? order by bookid DESC " ;
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	
	return list;
	}


	@Override
	public List<BookDtls> getBookByOld(String email, String category) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql="select * from book_dtls where bookCategory=? and useremail=?  ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
			
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		
		
		return list;
	}


	@Override
	public boolean olddeleteBooks(String email, String category,int bookid) {
		// TODO Auto-generated method stub
				boolean f=false;
						try {
							String sql="delete from book_dtls where bookCategory=? and useremail=? and bookid=?";
							PreparedStatement ps=conn.prepareStatement(sql);
							ps.setString(1,category);
							ps.setString(2,email);
							ps.setInt(3, bookid);
							int i=ps.executeUpdate();
							if(i==1) {
								f=true;
							}
						} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}
				return f;
	}


	@Override
	public List<BookDtls> getBookSearch(String ch) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql="select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setEmail(rs.getString(8));
			
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		
		
		return list;
	}

	
	
}
