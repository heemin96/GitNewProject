package mysql.date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.spi.DirStateFactory.Result;

public class GuestDao {
	DbConnect db=new DbConnect();

	//insert
	public void guestInsert(GuestDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into guest (writer,pass,avata,content,writeday) values (?,?,?,?,now())";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getAvata());
			pstmt.setString(4, dto.getContent());

			//실행
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	//update
	public void guestUpdate(GuestDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update guest set writer=?,avata=?,content=? where num=?";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getAvata());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getNum());

			//실행
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체 출력
	public List<GuestDto> getAllGuest() //
	{
		List<GuestDto> list=new Vector<GuestDto>();
		String sql="select * from guest order by num desc";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				GuestDto dto=new GuestDto();
				dto.setNum(rs.getString("num"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setWriter(rs.getString("writer"));
				dto.setAvata(rs.getString("avata"));
				dto.setContent(rs.getString("content"));
				
				//list 에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//num 에 대한 데이타만 반환
	public GuestDto getData(String num)
	{
		GuestDto dto=new GuestDto();
		String sql="select * from guest where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next())
			{				
				dto.setNum(rs.getString("num"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setWriter(rs.getString("writer"));
				dto.setAvata(rs.getString("avata"));
				dto.setContent(rs.getString("content"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//삭제
	public void guestDelete(String num)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from guest where num=?";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1,num);
			
			//실행
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//비번이 맞으면  true
	public boolean isEqualPass(String num,String pass)
	{
		GuestDto dto=new GuestDto();
		String sql="select * from guest where num=? and pass=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean r=false;
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next())//비번이 맞는경우
			{				
				r=true;			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return r;
	}
}













