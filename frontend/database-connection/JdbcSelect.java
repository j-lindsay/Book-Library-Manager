package application;

import java.sql.*;

public class JdbcSelect {

	public static void display(ResultSet rs) throws SQLException {
		try {
			while(rs.next()) { 
				int id = rs.getInt("id");
				String isbn = rs.getString("isbn");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String genre = rs.getString("genre");
				Boolean loanStatus = rs.getBoolean("loanStatus");

				System.out.println("\nid: " + id);
				System.out.println("ISBN: "  + isbn);
				System.out.println("Title: "  + title);
				System.out.println("Author: "  + author);
				System.out.println("Genre: "  + genre);
				System.out.println("Loan status: "  + loanStatus);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	public static void main(String[] args) throws SQLException {
		String url = "jdbc:mysql://localhost:3306/homelib";
		String username = "myuser";
		String password = "Cowtipper_21_42";
		String query = "{CALL getBooks(-1)}";
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			
			con = DriverManager.getConnection(url, username, password);
			pst = con.prepareCall(query);
			rs = pst.executeQuery();
			
			display(rs);

			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
