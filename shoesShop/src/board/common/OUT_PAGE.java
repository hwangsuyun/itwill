/*********************************************
파    일   명 : OUT_PAGE.java            
기         능 : 페이지 결과 빈           
관련 프로그램 : jsp                      
변         경 :                          
*********************************************/

package board.common;

import java.io.*;

public class OUT_PAGE implements Serializable
{
  public int beginPage;    //시작페이지
  public int endPage;      //끝페이지
  public int currentPage;  //현재페이지
  public int rowCount;     //전체열수
  public int pageSize;     // 페이지갯수
  public int previousMore;
  public int nextMore;
  public boolean isShowFirstIcon;
  public boolean isShowPreviousIcon;
  public boolean isShowNextIcon;
  public boolean isShowLastIcon;
  public boolean isShowPreviousMoreIcon;
  public boolean isShowNextMoreIcon;

  public OUT_PAGE(){}

  public OUT_PAGE(
		    int beginPage,
		    int endPage,
		    int currentPage,
		    int rowCount,
		    int pageSize,
		    int previousMore,
		    int nextMore,
		    boolean isShowFirstIcon,
		    boolean isShowPreviousIcon,
		    boolean isShowNextIcon,
		    boolean isShowLastIcon,
		    boolean isShowPreviousMoreIcon,
		    boolean isShowNextMoreIcon
			)
  {
      this.beginPage = beginPage;
      this.endPage = endPage;
      this.currentPage = currentPage;
      this.rowCount = rowCount;
      this.pageSize = pageSize;
      this.previousMore = previousMore;
      this.nextMore = nextMore;
      this.isShowFirstIcon = isShowFirstIcon;
      this.isShowPreviousIcon = isShowPreviousIcon;
      this.isShowNextIcon = isShowNextIcon;
      this.isShowLastIcon = isShowLastIcon;
      this.isShowPreviousMoreIcon = isShowPreviousMoreIcon;
      this.isShowNextMoreIcon = isShowNextMoreIcon;
  }

}
