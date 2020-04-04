package board.bbs;


import java.sql.*;

public class BatchUpdate20 {
	
    public static void main(String args[]) {
        //if(args.length==0){
        //		System.out.println("Usage: java BatchUpdate20 <number>");
        //		return;
        //}
        
        
        String driver ="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:user1/user1@127.0.0.1:1521:XE";
		Connection con=null;
        Statement stmt=null;
				
        try {
            Class.forName(driver);
        } catch(java.lang.ClassNotFoundException e) {
            System.err.print("ClassNotFoundException: ");
            System.err.println(e.getMessage());
        }
				String query=null;
        try {
            con = DriverManager.getConnection(url);
            //stmt=con.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            //stmt=con.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_UPDATABLE);
            //stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            //stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            
            //stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            con.setAutoCommit(false); 
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            //int count=Integer.parseInt(args[0]);
            /******************JDBC 2.0 addBatch 사용***************************/
            
            for(int i=2;i<=3560;i++){
            	query="insert into BBS values ("+i+", '김경호"+i+"', 'guard@korea.com', 'http://www.naver.com', '게시판 사용법"+i+"', '잘 사용하십시요"+i+"', sysdate, '1111', 0, "+i+", 0, 0, 0, 'x')";
    			stmt.addBatch(query);
			 

			}
				int [] updateCounts = stmt.executeBatch();
					    con.commit();
						System.out.println("BBS Table insert successfully!!!");
					  
					  }catch(Exception e){
					  	try{
							con.rollback();	
						}catch(SQLException e1){
						}
						System.out.println(e.getMessage());
					  	System.out.println(query);
					  }
		}//end main  
					  
}//end class
