package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import beans.Book;

public class BookDao {

	public ArrayList queryAllBook() throws Exception{
		Connection conn = null;
		ArrayList books = new ArrayList();
		try {
			Class.forName("org.sqlite.JDBC");
	        conn = DriverManager.getConnection("jdbc:sqlite::resource:books.db");
			String sql = "select * from books";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			while(rs.next()) {
				Book book=new Book();
				book.setBookname(rs.getString("bookname"));
				book.setBookauthor(rs.getString("bookAuthor"));
				book.setBookid(rs.getString("bookType"));
				book.setBookprice(rs.getString("bookPrice"));
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(conn !=null) {
					conn.close();
					conn=null;
				}
			}catch(Exception ex){
				
			}
		}
		
		return books;
	}
}
