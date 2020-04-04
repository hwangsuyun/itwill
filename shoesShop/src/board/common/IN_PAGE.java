/*********************************************
파    일   명 : IN_PAGE.java           
기         능 : 페이지 설정 관련 빈    
관련 프로그램 : jsp                    
변         경 :                        
*********************************************/

package board.common;
import java.io.*;

public class IN_PAGE implements Serializable
{
  public int linesPerPage;  // 페이지당 출력라인의 수
  public int pageIndex;     // 한페이지에 나타나는 페이지 인텍스의 갯수
  public String pageParam;  // Click한 페이지 navigator(INDEX) 값

  public IN_PAGE(){}

  public IN_PAGE(int linesPerPage,int pageIndex,String pageParam)
  {
      this.linesPerPage = linesPerPage;
      this.pageIndex = pageIndex;
      this.pageParam = pageParam;
  }
}
