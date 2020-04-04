<%@page import="board.bbs.BBSManager"%>
<%@page import="board.bbs.INSERT_BBS"%>
<%@page import="java.util.Enumeration"%>
<%@page import="board.common.MultipartRequest"%>
<%@ page language="Java"
         contentType="text/html; charset=EUC_KR"%>


<%
	String cPage = request.getParameter("cPage");
		if(cPage == null) cPage="";
	
	String bbs_title    = "";
	String bbs_content  = "";
	String bbs_name     = "";
	String bbs_passwd   = "";
	String bbs_homepage = "";
	String bbs_email    = "";
	String bbs_filename = "";


	//답변쓰기에 필요한 변수들....(히든으로 넘어오는 값들..)
	String insertType   = "";
	String bbs_no       = "";
	String bbs_to_no    = ""; 
	String bbs_group_no = "";
	String bbs_level    = "";
	String bbs_step     = "";


	try
		{
			
			// MultipartRequest 객체 생성(HttpRequest, "저장위치(bin)", 저장파일 최대크기)
			// 필터링 하는 클래스라고 보면 된다..
			String path=application.getRealPath("/UserFile");
			MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024);

			// 해쉬테이블 형태로 리턴
			Enumeration e = multi.getFileNames();
			while(e.hasMoreElements())
			{
				String name = (String)e.nextElement();
				bbs_filename = multi.getFilesystemName(name);
				if(bbs_filename == null) bbs_filename="미등록";
			}

			bbs_title    = multi.getParameter("bbs_title");
			bbs_content  = multi.getParameter("bbs_content");
			bbs_name     = multi.getParameter("bbs_name");
			bbs_passwd   = multi.getParameter("bbs_passwd");
			bbs_homepage = multi.getParameter("bbs_homepage");
			bbs_email    = multi.getParameter("bbs_email");
				if(bbs_email == null) bbs_email="미등록";

		
			insertType   = multi.getParameter("insertType");
				if(insertType == null) insertType = "new";
			bbs_no         = multi.getParameter("bbs_no");
				if(bbs_no == null) bbs_no = "";
			bbs_to_no      = multi.getParameter("bbs_to_no");
				if(bbs_to_no == null) bbs_to_no = "";
			bbs_group_no   = multi.getParameter("bbs_group_no");
				if(bbs_group_no == null) bbs_group_no = "";
			bbs_level      = multi.getParameter("bbs_level");
				if(bbs_level == null) bbs_level = "0";
			bbs_step       = multi.getParameter("bbs_step");
				if(bbs_step == null) bbs_step = "0";
		
	
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
%>

<%
	// 인세팅
	INSERT_BBS inBBS = new INSERT_BBS( bbs_name,
									   bbs_passwd, 
									   bbs_email, 
									   bbs_homepage, 
									   bbs_title, 
									   bbs_content, 
									   bbs_to_no, 
									   bbs_group_no, 
									   bbs_level, 
									   bbs_step, 
									   bbs_filename);
	
	
//	BBSBean BBS=new BBSBean();
	// insertBBS()메소드 콜.....
//	boolean flag = BBS.insertBBS(inBBS, insertType, bbs_no);
	boolean flag = BBSManager.getBBSManager().insertBBS(inBBS, insertType, bbs_no);


	if(flag)// 정상적으로 처리된 경우..
	{
		response.sendRedirect("../main.jsp?contentPage=bbs_list");
	}
	else
	{
%>
	<Script>
		alert("입력장애가 발생하였습니다...\n다시한번 시도해 주세요.");
		location.href='../main.jsp?contentPage=bbs_list';
	</Script>
<%
	}
%>
