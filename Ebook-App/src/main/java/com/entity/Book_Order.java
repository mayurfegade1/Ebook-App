package com.entity;

public class Book_Order {

	private int id;
	private String order_id;
	private String username;
	private String email;
	private String phno;
	private String fulladdress;
	private String bookName;
	private String author;
	private String price;
	
	private String paymentType;
	public Book_Order(int id, String username, String email, String phno, String fulladdress, String paymentType) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.phno = phno;
		this.fulladdress = fulladdress;
		
		this.paymentType = paymentType;
	}
	
	
	
	public Book_Order() {
		// TODO Auto-generated constructor stub
	}



	public String getBookName() {
		return bookName;
	}



	public void setBookName(String bookName) {
		this.bookName = bookName;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getOrder_id() {
		return order_id;
	}



	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}



	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFulladdress() {
		return fulladdress;
	}
	public void setFulladdress(String fulladdress) {
		this.fulladdress = fulladdress;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", username=" + username + ", email=" + email + ", phno=" + phno
				+ ", fulladdress=" + fulladdress + ", paymentType=" + paymentType + "]";
	}
	
	
	
	
	
}
