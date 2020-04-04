/*********************************************
파    일   명 : BBSBean.java           
기         능 : 게시판 관련 빈 
관련 프로그램 : jsp            
변         경 :                              *
*********************************************/

package board.bbs;

import java.sql.*;
import java.util.*;

import db.RdbmsDAO;

import board.common.CalPage;
import board.common.IN_PAGE;
import board.common.OUT_PAGE;
//import board.util.ConnectionPool;

public class BBSBean extends RdbmsDAO
{
	private static BBSBean bbsBean;
	private BBSBean() {}
	
	public static BBSBean getBBSBean()
	{
		if(bbsBean == null) bbsBean = new BBSBean();
		return bbsBean;
	}
	/*
	ConnectionPool conPool = null;
		
	public BBSBean()
	{
		try {
			conPool=ConnectionPool.getInstance();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ConnectionPool이 생성되었습니다...");
		System.out.println("게시판 관련 빈(BBSBean)이 시작되었습니다. >>>");
	}
	*/
	
		
	/*************************************************************
	* 게시판 전체 리스트 처리하는 메소드....
	*************************************************************/
	public synchronized OUTS_BBS getBBSList(IN_PAGE inPage, String search_type, String search_content)
	{
		// ruturn init
		OUTS_BBS outObjS = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con=null;

		// output init(OUTS_BBS가 2개의 객체를 받는다...)
		OUT_PAGE outPage = new OUT_PAGE();
		BBSRec[] BBSRecArray = new BBSRec[]{new BBSRec()};

		Vector vc = new Vector(2, 2);
		String errorSQL = ""; // 디버깅을 위한 sql

		// 페이지 계산 유틸 클래스 init
		CalPage calPage = new CalPage();				

		try
		{
			// #1. 먼저 전체 리스트 수를 먼저 알아야 한다.
			String sql01 = "SELECT count(*) cnt FROM BBS";

			// 검색 옵션별 게시판 Count 수
			if(search_type.equals("0")) // 전체
				sql01 = sql01;
			else if(search_type.equals("1")) // 제목으로 검색
				sql01 = sql01 + " WHERE bbs_title like '%" + search_content + "%'";
			else if(search_type.equals("2")) // 글쓴이로 검색
				sql01 = sql01 + " WHERE bbs_name = '" + search_content + "'";
			else if(search_type.equals("3")) // 내용으로 검색
				sql01 = sql01 + " WHERE bbs_content like '%" + search_content + "%'";

			
			errorSQL = "에러 발생 : " + sql01;
		//	con = conPool.getConnection();
			con = getConnection();
			pstmt = con.prepareStatement(sql01);
			rs = pstmt.executeQuery();
			rs.next();

			outPage.rowCount = Integer.parseInt(String.valueOf(rs.getString("cnt")));
			rs.close();
			pstmt.close();

			//System.out.println(outPage.rowCount);

			// OUT_PAGE를 위한 init
			int[] relPage = new int[8];
			
			relPage = calPage.doCalculatePage(inPage.pageParam,
											  inPage.pageIndex,
				                              inPage.linesPerPage,
											  outPage.rowCount);
			
			int pageIndex = inPage.pageIndex;  //한화면에 인덱스 갯수
			int beginPage = relPage[0];
			int endPage = relPage[1];
			int currentPage = relPage[2];
			int pageCount =  relPage[3]; //전체페이지수
			int startQ = relPage[4]; //쿼리시작하는 시점
			int endQ   = relPage[5]; //쿼리끝나는 시점
			int previousMore   = relPage[6]; //이전그룹
			int nextMore   = relPage[7]; //다음그룹
			
			//페이지관련 아웃풋 세팅
			outPage.beginPage = beginPage;
			outPage.endPage = endPage;
			outPage.currentPage = currentPage;
			outPage.pageSize = pageCount;
			outPage.previousMore = previousMore;
			outPage.nextMore = nextMore;
			outPage.isShowFirstIcon = calPage.isShowFirstIcon(currentPage,pageIndex);
			outPage.isShowPreviousIcon = calPage.isShowPreviousIcon(currentPage);
			outPage.isShowNextIcon = calPage.isShowNextIcon(currentPage,pageCount);
			outPage.isShowLastIcon = calPage.isShowLastIcon(endPage,pageCount);
			outPage.isShowPreviousMoreIcon = calPage.isShowPreviousMoreIcon(currentPage,pageIndex);
			outPage.isShowNextMoreIcon = calPage.isShowNextMoreIcon(endPage,pageCount);
			
			
			String  sql02 =
						"SELECT bbs_no, bbs_name, bbs_email, bbs_homepage, bbs_title, bbs_content, bbs_date, bbs_passwd, bbs_to_no, bbs_group_no, bbs_level, bbs_step, bbs_ref, bbs_filename" + 
						" FROM BBS";// ORDER BY bbs_date DESC";

			// 검색 옵션별...
			if(search_type.equals("0")) // 전체
				sql02 = sql02;
			else if(search_type.equals("1")) // 제목으로 검색
				sql02 = sql02 + " WHERE bbs_title like '%" + search_content + "%'";
			else if(search_type.equals("2")) // 글쓴이로 검색
				sql02 = sql02 + " WHERE bbs_name = '" + search_content + "'";
			else if(search_type.equals("3")) // 내용으로 검색
				sql02 = sql02 + " WHERE bbs_content like '%" + search_content + "%'";
			
			sql02 = sql02 + " ORDER BY bbs_group_no DESC, bbs_step ASC";

						
			errorSQL = "에러 발생 : " + sql02;

			pstmt = con.prepareStatement(sql02);
			rs = pstmt.executeQuery();
			
			if(outPage.rowCount > 0)
			{
				rs.next();

				//페이지 만큼 반복시킨다..
				for(int i=0; i<startQ-1; i++){rs.next();}				
				
				
				for(int i=startQ; i<=endQ; i++)
				{
					
					// 여기부터 다시...........
					vc.addElement(new BBSRec(
                               rs.getString("bbs_no"),
                               rs.getString("bbs_name"),
                               rs.getString("bbs_email"),
                               rs.getString("bbs_homepage"),
                               rs.getString("bbs_title"),
                               rs.getString("bbs_content"),
                               rs.getString("bbs_date"),
	  				           rs.getString("bbs_passwd"),
						       rs.getString("bbs_to_no"),
						       rs.getString("bbs_group_no"),
						       rs.getString("bbs_level"),
						       rs.getString("bbs_step"),
						       rs.getString("bbs_ref"),
						       rs.getString("bbs_filename"))
						       );

					rs.next();
				}
				
				BBSRec[] tmp = new BBSRec[vc.size()];
				vc.copyInto(tmp);
				BBSRecArray = tmp;
				vc.clear();
			}
			else// 리스트가 없을 경우
			{
				vc.addElement(new BBSRec("", "", "", "", "", "", "", "", "", "", "", "", "", ""));
				BBSRec[] tmp = new BBSRec[vc.size()];
				vc.copyInto(tmp);
				BBSRecArray = tmp;
				vc.clear();
			}
			
			rs.close();
			pstmt.close();
			
		}
		catch(SQLException ex)
		{
			System.out.println("*** 에러발생[getBBSList()] ***" + "\n" + 
					               "에러코드 : " + ex.getErrorCode() + "\n" + 
					               "에러메세지:" + ex.toString());
			System.out.println("*** 에러발생[getBBSList()] ***" + "\n" + errorSQL);
		}finally{
			
			try {
			//	conPool.releaseConnection(con);
				releaseConnection(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		outObjS = new OUTS_BBS(outPage, BBSRecArray);
		
		return outObjS;
	}// getBBSList() End...................

	


	
	/*************************************************************
	* 게시판 글쓰기/답변쓰기 처리하는 메소드....
	*************************************************************/
	public synchronized boolean insertBBS(INSERT_BBS inBBS, String insertType, String bbs_no)
	{
		String bbs_name = inBBS.bbs_name;
		String bbs_passwd = inBBS.bbs_passwd;
		String bbs_email = inBBS.bbs_email; 
		String bbs_homepage = inBBS.bbs_homepage;
	    String bbs_title = inBBS.bbs_title;
        String bbs_content = inBBS.bbs_content;
	    String bbs_to_no = inBBS.bbs_to_no;
	    String bbs_group_no = inBBS.bbs_group_no;
	    String bbs_level = inBBS.bbs_level;
	    String bbs_step = inBBS.bbs_step;
	    String bbs_filename = inBBS.bbs_filename;
				
		
		// ruturn init
		boolean returnFlag = false;
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String errorSQL = "";  //디버깅을 위한 sql
		
		
		// bbs_no을 알아오기 위한 1차sql
		String sql01 = "SELECT max(bbs_no)+1 bbs_no FROM BBS";
		errorSQL = "SQL 구분 에러 : " + sql01;
		
		String NO = "";

		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql01);
			rs = pstmt.executeQuery();
			rs.next();
			NO = rs.getString("bbs_no");
			rs.close();
			pstmt.close();

			
			// 신규쓰기인 경우.......
			if(insertType.equals("new"))
			{
				bbs_to_no = "0";
				bbs_group_no = NO;
				bbs_level = "0";
				bbs_step = "0";
			}
			else if(insertType.equals("re"))// 답변쓰기 인 경우
			{
				bbs_to_no = bbs_no;
				bbs_group_no = bbs_group_no;
				bbs_level = String.valueOf((Integer.parseInt(bbs_level)+1));
				bbs_step = String.valueOf((Integer.parseInt(bbs_step)+1));

				// 기존 하부 level의 스텝을 1씩 증가시킨다..
				String query_step = "UPDATE BBS SET bbs_step = bbs_step+1" + 
				                    " WHERE bbs_group_no=" + bbs_group_no + "" +
										  " AND bbs_step >=" + bbs_step + "";
				pstmt = con.prepareStatement(query_step);
				pstmt.executeUpdate();
				pstmt.close();
			}

			String sql02 ="INSERT INTO BBS (" +
				                         " bbs_no," + 
				                         " bbs_name," +
			                             " bbs_email," +
				                         " bbs_homepage," +
									  	 " bbs_title," +
					  	                 " bbs_content," +
			                             " bbs_date," +
			                             " bbs_passwd," +
			                             " bbs_to_no," +
										 " bbs_group_no," +
				                         " bbs_level," +
				                         " bbs_step," +
			                             " bbs_ref," +
				                         " bbs_filename)" +
			      " VALUES ( " + NO + ", '" +
					             bbs_name + "', '" + 
		                         bbs_email + "', '" +
			                     bbs_homepage + "', '" +
			                     bbs_title + "', '" +
								 bbs_content + "', " +
			                     "sysdate" + ", '" +
			                     bbs_passwd + "', " + 
					             bbs_to_no + ", " +
					             bbs_group_no + ", " +
					             bbs_level + ", " +
			                     bbs_step + ", " +
								 "0" + ", '" +
			                     bbs_filename + "')";

				errorSQL = "SQL 구문 : " + sql02;
				System.out.println(sql02);
				pstmt = con.prepareStatement(sql02);
				pstmt.executeUpdate();
				pstmt.close();

				returnFlag = true;

			}
			catch(SQLException ex)
			{
				System.out.println("*** 에러발생[insertBBS()] ***" + "\n" + 
					               "에러코드 : " + ex.getErrorCode() + "\n" + 
					               "에러메세지:" + ex.toString());
				System.out.println("*** 에러발생[insertBBS()] ***" + "\n" + errorSQL);
			}finally{
				
				try {
					releaseConnection(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			}
			
			return returnFlag;
	}// insertBBS() End...





	/*************************************************************
	* 게시판 조회수 증가시키는 메소드....
	*************************************************************/
	public synchronized boolean upgradeRefCount(String bbs_no)
	{
		// ruturn init
		boolean isOk = false;
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String errorSQL = "";  //디버깅을 위한 sql

		
		try
		{
			// #1. 먼저 조회수 업데이트...
			String sql01 = "UPDATE BBS SET" +
				             " bbs_ref = bbs_ref+1" +
							 " WHERE bbs_no = " + bbs_no;

			errorSQL = "SQL 구분 에러 : " + sql01;
			con = getConnection();
			pstmt = con.prepareStatement(sql01);
			pstmt.executeUpdate();
			pstmt.close();
			isOk = true;

		}
		catch(SQLException ex)
		{
			System.out.println("*** 에러발생[upgradeRefCount()] ***" + "\n" + 
					               "에러코드 : " + ex.getErrorCode() + "\n" + 
					               "에러메세지:" + ex.toString());
			System.out.println("*** 에러발생[upgradeRefCount()] ***" + "\n" + errorSQL);
		}finally{
			
			try {
				releaseConnection(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		return isOk;
	}// upgradeRefCount() End.......................................



	/*************************************************************
	* 게시판 목록보기 처리하는 메소드....
	*************************************************************/
	public synchronized BBSRec getBBSListView(String bbs_no)
	{
		// ruturn init
		BBSRec rec = new BBSRec();
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String errorSQL = "";  //디버깅을 위한 sql

		
		try
		{
			// #1. SELECT
			String sql ="SELECT bbs_no, bbs_name, bbs_email, bbs_homepage, bbs_title, bbs_content, bbs_date, bbs_passwd, bbs_to_no, bbs_group_no, bbs_level, bbs_step, bbs_ref, bbs_filename" + 
				            " FROM BBS" +
				            " WHERE bbs_no = " + bbs_no;

			errorSQL = "SQL 구문 : " + sql;
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();

			rec.bbs_no = rs.getString("bbs_no");
			rec.bbs_name = rs.getString("bbs_name");
			rec.bbs_email = rs.getString("bbs_email");
			rec.bbs_homepage = rs.getString("bbs_homepage");
			rec.bbs_title = rs.getString("bbs_title");
			rec.bbs_content = rs.getString("bbs_content");
			rec.bbs_date = rs.getString("bbs_date");
			rec.bbs_passwd = rs.getString("bbs_passwd");
			rec.bbs_to_no = rs.getString("bbs_to_no");
			rec.bbs_group_no = rs.getString("bbs_group_no");
			rec.bbs_level = rs.getString("bbs_level");
			rec.bbs_step = rs.getString("bbs_step");
			rec.bbs_ref = rs.getString("bbs_ref");
			rec.bbs_filename = rs.getString("bbs_filename");
			
			rs.close();
			pstmt.close();
		}
		catch(SQLException ex)
		{
			System.out.println("*** 에러발생[getBBSListView()] ***" + "\n" + 
					               "에러코드 : " + ex.getErrorCode() + "\n" + 
					               "에러메세지:" + ex.toString());
			System.out.println("*** 에러발생[getBBSListView()] ***" + "\n" + errorSQL);
		}finally{
			
			try {
				releaseConnection(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		return rec;
	}// getBBSListView() End.......................................





	/***********************************************
	* 게시판 수정 처리 메소드
	***********************************************/
	public synchronized boolean bbsUpdate( String bbs_no, String bbs_title, 
										String bbs_content, String bbs_passwd,
										String bbs_email, String bbs_homepage)
	{
		// ruturn init
		boolean returnFlag = false;
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String errorSQL = "";  //디버깅을 위한 sql
		
		try
		{
			String  sql01 = "UPDATE BBS SET" +
                              " bbs_title='" + bbs_title + "'," +
				              " bbs_content='" + bbs_content + "' ," +
							  " bbs_passwd='" + bbs_passwd + "' ," +
							  " bbs_email='" + bbs_email + "' ," +
							  " bbs_homepage='" + bbs_homepage + "' " +
				              " WHERE bbs_no = " + bbs_no + "";

			errorSQL = "SQL 구분 에러 : " + sql01;
			con = getConnection();
			pstmt = con.prepareStatement(sql01);
			pstmt.executeUpdate();
			pstmt.close();
			returnFlag = true;
		}
		catch(SQLException ex)
		{
			System.out.println("*** 에러발생[bbsUpdate()] ***" + "\n" + 
					               "에러코드 : " + ex.getErrorCode() + "\n" + 
					               "에러메세지:" + ex.toString());
			System.out.println("*** 에러발생[bbsUpdate()] ***" + "\n" + errorSQL);
		}finally{
			
			try {
				releaseConnection(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		return returnFlag;
	} // bbsUpdate() End................................................




	/***********************************************
	* 게시판 삭제 처리 메소드
	***********************************************/
	public synchronized boolean bbsDelete(String bbs_no, String bbs_group_no, String bbs_level)
	{
		// ruturn init
		boolean hasNode = false;
		Connection con=null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;


		String errorSQL = "";  //디버깅을 위한 sql

	
		try
		{
			String  sql01 = " SELECT count(*) cnt " +
                              " FROM BBS" +
                              " WHERE bbs_group_no = " + bbs_group_no +
                              " AND bbs_level=" + (bbs_level+1) + "";

			errorSQL = "SQL 구분 에러 : " + sql01;
			con = getConnection();
			pstmt = con.prepareStatement(sql01);
			rs = pstmt.executeQuery();
			rs.next();
			
			if(rs.getInt("cnt") == 0)// 하위 답변이 없으면 삭제 가능
			{
				hasNode=false;
				
				String  sql02 = " DELETE FROM BBS " +
					              " WHERE bbs_no = " + bbs_no + "";

				errorSQL = "SQL 구분 에러 : " + sql02;

				pstmt2 = con.prepareStatement(sql02);
				pstmt2.executeUpdate();
				pstmt2.close();
			}
			else// 하위 답변이 있으면 삭제 불가능하게 하자...
			{
				hasNode=true;
			}
			rs.close();
			pstmt.close();
		}
		catch(SQLException ex)
		{
			System.out.println("*** 에러발생[bbsDelete()] ***" + "\n" + 
					               "에러코드 : " + ex.getErrorCode() + "\n" + 
					               "에러메세지:" + ex.toString());
			System.out.println("*** 에러발생[bbsDelete()] ***" + "\n" + errorSQL);
		}finally{
			
			try {
				releaseConnection(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		return hasNode;
	} // bbsDelete() End................................................


}// Class End
