package com.itwill.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;




public class MemberDaoSpringJDBC implements MemberDao {
//	DataSource dataSource;
	JdbcTemplate jdbcTemplate;// 커넥션 작업을 대신 해준다. 내가 만든 클래스 아니다.
							  // 데이터소스 객체가 있어야 함. 커넥션 풀이 있어야 함.
			
//	public DataSource getDataSource() {
//		return dataSource;
//	}

	public JdbcTemplate getjdbcTemplate() {
		return jdbcTemplate;
	}

	public void setjdbcTemplate(JdbcTemplate jdbcTemplate) {
		System.out.println("#### MemberDaoSpringJDBC() : setDataSource(JdbcTemplate jdbcTemplate) 호출  ");
		this.jdbcTemplate = jdbcTemplate;
	}

//	public void setDataSource(DataSource dataSource) {
//		System.out.println("#### UserDaoSpringJDBC() : setDataSource(DataSource dataSource) 호출  ");
//		this.dataSource = dataSource;
//	}

	public MemberDaoSpringJDBC() {
		System.out.println("#### MemberDaoSpringJDBC() : 디폴트생성자 호출  ");
	}

	@Override
	public int create(Member member) throws Exception {
		
		System.out.println("#### MemberDaoSpringJDBC() : create() 메소드 호출  ");
		
		String insertQuery = "insert into member values(?,?,?,?,?)";
		return jdbcTemplate.update(insertQuery,
				member.getId(), member.getPasswd(), member.getName(), member.getEmail1(), member.getEmail2());
	}

	@Override
	public int update(Member member) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member findMember(String id) throws Exception {
		System.out.println("#### MemberDaoSpringJDBC() : findUser() 메소드 호출  "+id);
		
		String selectQuery = "select * from member where id=?";
		System.out.println("11");
		return jdbcTemplate.queryForObject(selectQuery,
				new Object[]{id}, new RowMapper<Member>() {
		
					@Override
					public Member mapRow(ResultSet rs, int rowNo) throws SQLException {
						Member member = null;
						try{
						member = new Member(rs.getString("id"),
											rs.getString("passwd"),
											rs.getString("name"),
											rs.getString("email1"),
											rs.getString("email2"));
											
						System.out.println("22222");
										
						}catch(Exception e){
							
						}
						System.out.println("3333 ");
						return member;
					}
					});
	}

	@Override
	public List<Member> findUserList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existedUser(String id) throws Exception {
		System.out.println("#### UserDaoSpringJDBC() : existedUser() 메소드 호출  ");
		String existedQuery="select count(*) cnt from member where id=?";
		int userCount=jdbcTemplate.queryForInt(existedQuery, id);
		if(userCount==1){
			return true;
		}else{
			return false;
		}
	}

	
}