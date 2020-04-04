/*********************************************
파    일   명 : INSERT_BBS.java                 
기         능 : 인서트 객체    
관련 프로그램 : jsp            
변         경 :                 
*********************************************/

package board.bbs;

public class INSERT_BBS {


  public String bbs_name;
  public String bbs_passwd;
  public String bbs_email;
  public String bbs_homepage;
  public String bbs_title;
  public String bbs_content;
  public String bbs_to_no;
  public String bbs_group_no;
  public String bbs_level;
  public String bbs_step;
  public String bbs_filename;



  public INSERT_BBS(){}

  public INSERT_BBS(
	                 String bbs_name,
	                 String bbs_passwd,
	                 String bbs_email,
	                 String bbs_homepage,
	                 String bbs_title,
                     String bbs_content,
	                 String bbs_to_no,
	                 String bbs_group_no,
	                 String bbs_level,
	                 String bbs_step,
	                 String bbs_filename)
  {
      this.bbs_name = bbs_name;
	  this.bbs_passwd = bbs_passwd;
	  this.bbs_email = bbs_email;
	  this.bbs_homepage = bbs_homepage;
	  this.bbs_title = bbs_title;
  	  this.bbs_content = bbs_content;
	  this.bbs_to_no = bbs_to_no;
	  this.bbs_group_no = bbs_group_no;
	  this.bbs_level = bbs_level;
	  this.bbs_step = bbs_step;
	  this.bbs_filename = bbs_filename;
  }
}
