/*********************************************
파    일   명 : CalPage.java                 *
기         능 : 페이지 계산 객체             *
관련 프로그램 : jsp                          *
변         경 :                              *
*********************************************/

package board.common;

public class CalPage
{

  // 디폴트 생성자..
  public CalPage(){}


  //게시판 페이지구분 계산 메소드...
  public synchronized int[] doCalculatePage(String pageParam,int pageIndex, int linesPerPage, int rowCount)
  {
    // pageParam   : 선택한 페이지 인덱스
    // pageIndex   : 화면에 나타나는 페이지 인텍스의 갯수
    // linesPerPage: 페이지당 출력라인수
    // rowCount    : 전체레코드수
    
			

		System.out.println("선택한 페이지 인덱스" + pageParam);
		System.out.println("화면에 나타나는 페이지 인텍스의 갯수" + pageIndex);
		System.out.println("페이지당 출력라인수" + linesPerPage);
		System.out.println("전체레코드수" + rowCount);

	
	// 리턴 초기화...
		int[] relPage = new int[8]; 
    
	
	//-------------------------------------------------------------------------
	int pageCount = 1;    // 전체페이지수
    int beginPage = 1;    // 시작페이지 인덱스
    int endPage = 1;      // 끝페이지 인덱스
    int currentPage = 1;  // 페이지 인덱스
    int previousMore = 1; // 선택된 페이지를 기준으로 이전인덱스 번호
    int nextMore = 1;     // 선택된 페이지를 기준으로 다음인덱스 번호
    int groupNo = 1;      // 인덱스 갯수에 따른 그룹넘버
	//-------------------------------------------------------------------------
	
    int modula = 0;
    //전체레코드수가 1개 이상이면
    if (rowCount > 1)
    {
        modula = (rowCount) % linesPerPage;
        //linesPerPage(10)으로 나눈나머지가 0 이아니면 한페이지를 더한다
        if (modula!=0) modula = 1;
        //전체페이지수 가 계산된다
        pageCount = rowCount/linesPerPage + modula;
    }

    //----------------------------------------------------------------------
	// 현재페이지를 파라메터로 받지 못한 경우(디폴트)
	// 1.걍 전체보기한경우
	// 2.검색결과인경우
	if (pageParam.equals(""))
	{
      // 1페이지 선택을 디폴트로..
      endPage = pageIndex;
      //이전 페이지의 인덱스를 0 로 설정
      previousMore = 0;
      //다음 페이지의 인덱스를 11로 설정
      nextMore  =  pageIndex+1;
    }
    else
	{
      // 각각의 페이지번호 클릭한 경우..
	  	currentPage = Integer.parseInt(pageParam);
	  	//
       groupNo = (currentPage-1)/pageIndex;
	  	// 만일 pageIndex를 10으로 설정하였다면 1~10까지의
	  	// groupNo은 0이된다.
      beginPage = groupNo*pageIndex + 1;
      endPage   = groupNo*pageIndex+pageIndex;
      previousMore = beginPage - pageIndex;
	 	 	//첫번째 페이지일경우
	 	 	if(previousMore < 0){
		  	   previousMore = 0;
			}

     	nextMore     = beginPage + pageIndex;
     	 	//nextMore ===> 11
    }

    //-------------------------------------------------------------------
	//1 page 이상인경우
	if (pageCount > 0)
    {
    		//현재페이지가 페이지카운트보다 크다.
    		
        if (currentPage >= pageCount) {
          currentPage = pageCount;
        }
        else {
          currentPage = currentPage;
        }
    }

    //----------------------------------------------------------------
	////???????????????/
	if (beginPage > pageCount) beginPage = beginPage - pageIndex + 1;
    if (beginPage < 1) beginPage = 1;
    if (endPage > pageCount) endPage = pageCount;
  
    
	//-----------------------------------------------------------------
	//다음 쿼리는 어디서부터 어디까지 날리나?
    int startQ = 0; // 몇번째 레코드부터..
    int endQ   = 0; // 몇번째 레코드까지..
    if (currentPage == 1 && currentPage == pageCount)// 1페이지인경우..
    {
        startQ=1;
        endQ = rowCount;
    }
    else if ( currentPage < pageCount)
    {
        startQ=linesPerPage*currentPage-linesPerPage + 1;
        endQ = linesPerPage*currentPage-linesPerPage + linesPerPage;
    }
    else if ( currentPage == pageCount)
    {
        startQ=linesPerPage*currentPage-linesPerPage + 1; // 끝페이지인경우..
        endQ = rowCount;
    }

    relPage[0] = beginPage;
    relPage[1] = endPage;
    relPage[2] = currentPage;
    relPage[3] = pageCount;
    relPage[4] = startQ;
    relPage[5] = endQ;
    relPage[6] = previousMore;
    relPage[7] = nextMore;
		System.out.println("+++++++++++++++++++++++++");
		System.out.println("---Log Start------------");
		System.out.println("pageParam:"+pageParam);
		System.out.println("beginPage:"+beginPage);
		System.out.println("endPage:"+endPage);
		System.out.println("currentPage:"+currentPage);
		System.out.println("pageCount:"+pageCount);
		System.out.println("startQ:"+startQ);
		System.out.println("endQ:"+endQ);
		System.out.println("previousMore:"+previousMore);
		System.out.println("nextMore:"+nextMore);
		System.out.println("---Log End------------");

    return relPage;
  }

  
  
  
  /************************************************************************
   * 화면에 [처음으로] 아이콘 출력여부를 판단하는 메소드
  ************************************************************************/
  public synchronized boolean isShowFirstIcon(int currentPage,int pageIndex)
  {
    int modula;
    modula = currentPage % pageIndex;
    if (modula!=0) modula = 1;
    if ((currentPage / pageIndex + modula) > 1) return true;
    else return false;
  }


  /***********************************************************************
   * 화면에 [마지막으로] 아이콘 출력여부를 판단하는 메소드
   ***********************************************************************/
  public synchronized boolean isShowLastIcon(int endPage,int pageCount) {
    if (endPage < pageCount) return true;
    else return false;
  }

  
  
  /************************************************************************
   * 화면에 [이전페이지] 아이콘 출력여부를 판단하는 메소드
   ************************************************************************/
  public boolean isShowPreviousIcon(int currentPage)
  {
    if (currentPage > 1) return true;
    else return false;
  }

  
  
  /************************************************************************
   * 화면에 [다음페이지] 아이콘 출력여부를 판단하는 메소드
   ***********************************************************************/
  public boolean isShowNextIcon(int currentPage,int pageCount) {
    if (currentPage < pageCount) return true;
    else return false;
  }

  

  /***********************************************************************
   * 화면에 [이전 pageIndex페이지] 아이콘 출력여부를 판단하는 메소드
   **********************************************************************/
  public synchronized boolean isShowPreviousMoreIcon(int currentPage,int pageIndex) {
    int modula;
    modula = currentPage % pageIndex;
    if (modula!=0) modula = 1;
    if ((currentPage / pageIndex + modula) > 1) return true;
    else return false;
  }

  /**********************************************************************
   * 화면에 [다음 pageIndex페이지] 아이콘 출력여부를 판단하는 메소드
   **********************************************************************/
  public synchronized boolean isShowNextMoreIcon(int endPage,int pageCount) {
    if (endPage < pageCount) return true;
    else return false;
  }

}// CalPage End..........................................................
