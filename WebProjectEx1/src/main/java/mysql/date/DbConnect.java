package mysql.date;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnect {
	static final String DRIVER="com.mysql.cj.jdbc.Driver";//5
	//static final String DRIVER="com.mysql.cj.jdbc.Driver";//8
	
	//static final String URL="jdbc:mysql://localhost:3306/bitcamp";//5버전
	static final String URL="jdbc:mysql://localhost:3306/bitcamp?serverTimezone=Asia/Seoul";//5,8버전

	
	public DbConnect() 
	{
		
	try {
		Class.forName(DRIVER);
	} catch(ClassNotFoundException e) {
		System.out.println("Mysql 드라이버 오류 +" +e.getMessage());
	}
	
}
	
	public Connection getConnection() 
	{
		
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(URL,"root","qwer12345");
		} catch (SQLException e) {
			System.out.println("Mysql 연결 실패" + e. getMessage());
		}
		return conn;
	}


	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn)
	{
		try {
			pstmt.close();
				conn.close();
			}catch(SQLException e) {}
		}
	
	
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {}
		}
	}
