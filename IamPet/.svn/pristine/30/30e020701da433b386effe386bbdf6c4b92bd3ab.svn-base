package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.RdbmsDAO;

public class PostDAO extends RdbmsDAO
{
	private static PostDAO postDAO;
	private PostDAO() { }
	
	public static PostDAO getPostDAO()
	{
		if(postDAO == null) postDAO = new PostDAO();			
		return postDAO;
	}

	public ArrayList<PostDTO> getAddress(String search)throws Exception
	{
		ArrayList<PostDTO> postList = new ArrayList<PostDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select zipcode, address from zipcode where address like '%'||?||'%'";
		try
		{
			con =  getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				String zipcode = rs.getString("zipcode");
				String address = rs.getString("address");				
				postList.add(new PostDTO(zipcode, address));			
			}
		}
		finally
		{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) releaseConnection(con);
		}
		
		return postList;
	}


}
