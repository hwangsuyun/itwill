package basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.RdbmsDAO;

public class BasketDAO extends RdbmsDAO{

	private static BasketDAO _basketDAO;

	private BasketDAO() {}

	public static BasketDAO getBasketDAO() {

		if (_basketDAO == null) {
			_basketDAO = new BasketDAO();
		}
		return _basketDAO;
	}

	//멤버아이디 장바구니삭제
	public int remove(String member_id)throws Exception
	{	
		int row = 0 ;
		Connection con = null;
		PreparedStatement pstmt = null;
		String remove = "delete from basket where member_id=?";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(remove);
			pstmt.setString(1, member_id);
			row = pstmt.executeUpdate();
		}
		finally
		{
			if(pstmt != null)
			{
				pstmt.close();
			}
			if(con != null)
			{
				releaseConnection(con);
			}
		}
		return row;
	}


	//멤버아이디 장바구니삭제
	public int DeleteByNo(String basket_no)throws Exception{
		
		int row = 0 ;
		Connection con = null;
		PreparedStatement pstmt = null;
		String remove = "delete from basket where basket_no=?";
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(remove);
			pstmt.setString(1, basket_no);
			row = pstmt.executeUpdate();
		}finally{
			if(pstmt != null)	pstmt.close();
			if(con != null)		releaseConnection(con);
		}
		return row;
	}




	//장바구니 생성날짜별 전체조회
	public ArrayList<BasketDTO> dateAll(String basket_date)throws Exception
	{
		ArrayList<BasketDTO> arrayList = new ArrayList<BasketDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dateAll = "select basket_no,basket_date,item_code," +
				"item_option,item_price,item_cnt,member_id from basket where basket_date=?";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(dateAll);
			pstmt.setString(1, basket_date);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				arrayList.add(new BasketDTO(rs.getInt("basket_no"), 
						rs.getString("basket_date"), 
						rs.getString("item_code"), 
						rs.getString("item_option"), 
						rs.getInt("item_price"),
						rs.getInt("item_cnt"), 
						rs.getString("member_id")));
			}

		}
		finally
		{
			if(rs != null)
			{
				rs.close();
			}
			if(pstmt != null)
			{
				pstmt.close();
			}
			if(con != null)
			{
				releaseConnection(con);
			}
		}
		return arrayList;
	}
	//전체 장바구니 조회
	public ArrayList<BasketDTO> allBasket()throws Exception
	{
		ArrayList<BasketDTO> arrayList = new ArrayList<BasketDTO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String allBasket = "select basket_no,basket_date,item_code," +
				"item_option,item_price,item_cnt,member_id from basket";

		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(allBasket);
			rs = pstmt.executeQuery();

			while(rs.next())
			{
				arrayList.add(new BasketDTO(rs.getInt("basket_no"), 
						rs.getString("basket_date"), 
						rs.getString("item_code"), 
						rs.getString("item_option"), 
						rs.getInt("item_price"),
						rs.getInt("item_cnt"), 
						rs.getString("member_id")));
			}

		}
		finally
		{
			if(rs != null)
			{
				rs.close();
			}
			if(pstmt != null)
			{
				pstmt.close();
			}
			if(con != null)
			{
				releaseConnection(con);
			}
		}
		return arrayList;
	}
	//멤버아이디 장바구니 찾기
	public ArrayList<BasketDTO> findBasket(String member_id)throws Exception
	{	
		ArrayList<BasketDTO> arrayList = new ArrayList<BasketDTO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String findBasket = "select basket_no,basket_date,item_code," +
				"item_option,item_price,item_cnt,member_id from basket where member_id=?";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(findBasket);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();

			while(rs.next())
			{
				arrayList.add( new BasketDTO(rs.getInt("basket_no"), 
						rs.getString("basket_date"), 
						rs.getString("item_code"), 
						rs.getString("item_option"), 
						rs.getInt("item_price"),
						rs.getInt("item_cnt"), 
						rs.getString("member_id")));
			}
		}
		finally
		{
			if(rs !=null)
			{
				rs.close();
			}
			if(pstmt != null)
			{
				pstmt.close();
			}
			if(con != null)
			{
				releaseConnection(con);
			}
		}
		return arrayList;

	}


	//장바구니 화면 출력하기
	public ArrayList findBasketJoin(String member_id)throws Exception{	

		ArrayList arrayList = new ArrayList();
		HashMap map = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "SELECT b.BASKET_NO, c.C_PART_CODE AS part_code ,b.item_Code AS name_code, c.C_NAME AS item_name, DECODE(b.ITEM_OPTION,'M','남','F','여') AS item_sex, b.ITEM_PRICE, b.ITEM_CNT FROM BASKET b, cat c WHERE b.MEMBER_ID=? AND b.item_code=c.c_name_code";

		try{
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				map = new HashMap<String,String>();
				map.put("basket_no", rs.getString("basket_no"));
				map.put("part_code", rs.getString("part_code"));
				map.put("name_code", rs.getString("name_code"));
				map.put("item_name", rs.getString("item_name"));
				map.put("item_sex", rs.getString("item_sex"));
				map.put("item_price", rs.getString("item_price"));
				map.put("item_cnt", rs.getString("item_cnt"));
				arrayList.add(map);
			}
		}finally{		

			if(rs !=null)		 rs.close();
			if(pstmt != null)	pstmt.close();
			if(con != null)		releaseConnection(con);
		}
		return arrayList;

	}


	public ArrayList selectBasket(String member_id) throws SQLException{

		ArrayList arrayList = new ArrayList();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String findQuery = "SELECT b.item_code, c.C_NAME AS item_name, DECODE(b.item_option,'M','남','F','여') AS item_sex, b.item_price, b.item_cnt" +
				"FROM BASKET b, CAT c" +
				"WHERE member_id=?" +
				"AND b.ITEM_CODE = c.C_NAME_CODE";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(findQuery);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();

			while(rs.next())
			{
				String item_code = rs.getString("item_code");
				String item_name = rs.getString("item_name");
				String item_sex = rs.getString("item_sex");
				String item_price = rs.getString("item_price");
				String item_cnt = rs.getString("item_cnt");


				arrayList.add(item_code);
				arrayList.add(item_name);
				arrayList.add(item_sex);
				arrayList.add(item_price);
				arrayList.add(item_cnt);
			}
		}
		finally{

			if(rs !=null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(con != null)		releaseConnection(con);
		}

		return arrayList;

	}

	//해당아이템 구매한 사람들 찾기
	public ArrayList<BasketDTO> itemMember(String item_code)throws Exception
	{
		ArrayList<BasketDTO> arrayList = new ArrayList<BasketDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String itemcode = "select basket_no,basket_date,item_code," +
				"item_option,item_price,item_cnt,member_id from basket where item_code=?";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(itemcode);
			pstmt.setString(1, item_code);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				arrayList.add(new BasketDTO(rs.getInt("basket_no"), 
						rs.getString("basket_date"), 
						rs.getString("item_code"), 
						rs.getString("item_option"), 
						rs.getInt("item_price"),
						rs.getInt("item_cnt"), 
						rs.getString("member_id")));
			}
		}
		finally
		{
			if(rs != null)
			{
				rs.close();
			}
			if(pstmt != null)
			{
				pstmt.close();
			}
			if(con != null)
			{
				releaseConnection(con);
			}
		}
		return arrayList;

	}

	/*
	 * 장바구니 입력
	 *  BASKET_NO   NOT NULL NUMBER         
			BASKET_DATE NOT NULL DATE           
			ITEM_CODE   NOT NULL NVARCHAR2(100) 
			ITEM_OPTION NOT NULL NVARCHAR2(100) 
			ITEM_PRICE  NOT NULL NUMBER         
			ITEM_CNT    NOT NULL NUMBER         
			MEMBER_ID   NOT NULL NVARCHAR2(100)
	 */
	public int create(BasketDTO basketDto) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into basket values(basket_seq.NEXTVAL,sysdate,?,?,?,?,?)";
		try{
			con = getConnection();
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setString(1, basketDto.getItem_code());
			pstmt.setString(2, basketDto.getItem_option());
			pstmt.setInt(3, basketDto.getItem_price());
			pstmt.setInt(4, basketDto.getItem_cnt());
			pstmt.setString(5, basketDto.getMember_id());
			int rows = pstmt.executeUpdate();
			return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}


	/*
	 * 장바구니 수정
	 */
	public int update(BasketDTO basketDto) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update basket set basket_date=sysdate,item_code=?,item_option=?," +
				"item_price=?,item_cnt=?,member_id=? where basket_no=?";
		try{
			con = getConnection();
			pstmt=con.prepareStatement(updateQuery);
			pstmt.setString(1, basketDto.getItem_code());
			pstmt.setString(2, basketDto.getItem_option());
			pstmt.setInt(3, basketDto.getItem_price());
			pstmt.setInt(4, basketDto.getItem_cnt());
			pstmt.setString(5, basketDto.getMember_id());
			pstmt.setInt(6, basketDto.getBasket_no());
			int rows=pstmt.executeUpdate();
			return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}


	//멤버아이디 장바구니 찾기
	public BasketDTO findBasketByNo(int no) throws Exception
	{							
		BasketDTO basket = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String findBasket = "select * from basket where basket_no=?";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(findBasket);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();				
			if(rs.next())
			{
				basket = new BasketDTO(rs.getInt("basket_no"), 
						rs.getString("basket_date"), 
						rs.getString("item_code"), 
						rs.getString("item_option"), 
						rs.getInt("item_price"),
						rs.getInt("item_cnt"), 
						rs.getString("member_id"));
			}
		}
		finally
		{
			if(rs !=null)
			{
				rs.close();
			}
			if(pstmt != null)
			{
				pstmt.close();
			}
			if(con != null)
			{
				releaseConnection(con);
			}
		}
		return basket;

	}


}
