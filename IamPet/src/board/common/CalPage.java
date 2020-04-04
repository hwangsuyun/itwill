/*********************************************
��    ��   �� : CalPage.java                 *
��         �� : ������ ��� ��ü             *
���� ���α׷� : jsp                          *
��         �� :                              *
*********************************************/

package board.common;

public class CalPage
{

  // ����Ʈ ������..
  public CalPage(){}


  //�Խ��� ���������� ��� �޼ҵ�...
  public synchronized int[] doCalculatePage(String pageParam,int pageIndex, int linesPerPage, int rowCount)
  {
    // pageParam   : ������ ������ �ε���
    // pageIndex   : ȭ�鿡 ��Ÿ���� ������ ���ؽ��� ����
    // linesPerPage: �������� ��¶��μ�
    // rowCount    : ��ü���ڵ��
    
			

		System.out.println("������ ������ �ε���" + pageParam);
		System.out.println("ȭ�鿡 ��Ÿ���� ������ ���ؽ��� ����" + pageIndex);
		System.out.println("�������� ��¶��μ�" + linesPerPage);
		System.out.println("��ü���ڵ��" + rowCount);

	
	// ���� �ʱ�ȭ...
		int[] relPage = new int[8]; 
    
	
	//-------------------------------------------------------------------------
	int pageCount = 1;    // ��ü��������
    int beginPage = 1;    // ���������� �ε���
    int endPage = 1;      // �������� �ε���
    int currentPage = 1;  // ������ �ε���
    int previousMore = 1; // ���õ� �������� �������� �����ε��� ��ȣ
    int nextMore = 1;     // ���õ� �������� �������� �����ε��� ��ȣ
    int groupNo = 1;      // �ε��� ������ ���� �׷�ѹ�
	//-------------------------------------------------------------------------
	
    int modula = 0;
    //��ü���ڵ���� 1�� �̻��̸�
    if (rowCount > 1)
    {
        modula = (rowCount) % linesPerPage;
        //linesPerPage(10)���� ������������ 0 �̾ƴϸ� ���������� ���Ѵ�
        if (modula!=0) modula = 1;
        //��ü�������� �� ���ȴ�
        pageCount = rowCount/linesPerPage + modula;
    }

    //----------------------------------------------------------------------
	// ������������ �Ķ���ͷ� ���� ���� ���(����Ʈ)
	// 1.�� ��ü�����Ѱ��
	// 2.�˻�����ΰ��
	if (pageParam.equals(""))
	{
      // 1������ ������ ����Ʈ��..
      endPage = pageIndex;
      //���� �������� �ε����� 0 �� ����
      previousMore = 0;
      //���� �������� �ε����� 11�� ����
      nextMore  =  pageIndex+1;
    }
    else
	{
      // ������ ��������ȣ Ŭ���� ���..
	  	currentPage = Integer.parseInt(pageParam);
	  	//
       groupNo = (currentPage-1)/pageIndex;
	  	// ���� pageIndex�� 10���� �����Ͽ��ٸ� 1~10������
	  	// groupNo�� 0�̵ȴ�.
      beginPage = groupNo*pageIndex + 1;
      endPage   = groupNo*pageIndex+pageIndex;
      previousMore = beginPage - pageIndex;
	 	 	//ù��° �������ϰ��
	 	 	if(previousMore < 0){
		  	   previousMore = 0;
			}

     	nextMore     = beginPage + pageIndex;
     	 	//nextMore ===> 11
    }

    //-------------------------------------------------------------------
	//1 page �̻��ΰ��
	if (pageCount > 0)
    {
    		//������������ ������ī��Ʈ���� ũ��.
    		
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
	//���� ������ ��𼭺��� ������ ������?
    int startQ = 0; // ���° ���ڵ����..
    int endQ   = 0; // ���° ���ڵ����..
    if (currentPage == 1 && currentPage == pageCount)// 1�������ΰ��..
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
        startQ=linesPerPage*currentPage-linesPerPage + 1; // ���������ΰ��..
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
   * ȭ�鿡 [ó������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
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
   * ȭ�鿡 [����������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
   ***********************************************************************/
  public synchronized boolean isShowLastIcon(int endPage,int pageCount) {
    if (endPage < pageCount) return true;
    else return false;
  }

  
  
  /************************************************************************
   * ȭ�鿡 [����������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
   ************************************************************************/
  public boolean isShowPreviousIcon(int currentPage)
  {
    if (currentPage > 1) return true;
    else return false;
  }

  
  
  /************************************************************************
   * ȭ�鿡 [����������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
   ***********************************************************************/
  public boolean isShowNextIcon(int currentPage,int pageCount) {
    if (currentPage < pageCount) return true;
    else return false;
  }

  

  /***********************************************************************
   * ȭ�鿡 [���� pageIndex������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
   **********************************************************************/
  public synchronized boolean isShowPreviousMoreIcon(int currentPage,int pageIndex) {
    int modula;
    modula = currentPage % pageIndex;
    if (modula!=0) modula = 1;
    if ((currentPage / pageIndex + modula) > 1) return true;
    else return false;
  }

  /**********************************************************************
   * ȭ�鿡 [���� pageIndex������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
   **********************************************************************/
  public synchronized boolean isShowNextMoreIcon(int endPage,int pageCount) {
    if (endPage < pageCount) return true;
    else return false;
  }

}// CalPage End..........................................................
