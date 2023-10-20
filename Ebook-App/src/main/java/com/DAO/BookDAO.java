package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	public int addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBook();
	
	public List<BookDtls> getOldBook();
	
	public List<BookDtls> getAllRecentBook();

	public List<BookDtls> getAllNewBook();
	
	public List<BookDtls> getAllOldtBook();
	public List<BookDtls> getBookByOld(String email,String category);
	
	public boolean olddeleteBooks(String email,String category,int bookid);
		
	public List<BookDtls> getBookSearch(String ch);
		
	
}
