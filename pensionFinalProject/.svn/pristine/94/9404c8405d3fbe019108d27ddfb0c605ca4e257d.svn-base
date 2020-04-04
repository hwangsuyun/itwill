package com.itwill.pension;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class PensionDaoSpringJDBC implements PensionDao{
	//db연결
	JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		
		return jdbcTemplate;
	}
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		System.out.println("#### PensionDaoSpringJDBC() : setJdbcTemplate(JdbcTemplate jdbcTemplate) 호출  ");
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public PensionDaoSpringJDBC() {
		// TODO Auto-generated constructor stub
	}
	
	
	//지역별 펜션명으로 펜션리스트 뿌리기
	@Override
	public List<Pension> findPension(String p_group) throws Exception {
		System.out.println("#### PensionDaoSpringJDBC : findPension()메쏘드 호출  ");
		String selectQuery = "select * from pension where p_group=?";
		return jdbcTemplate.query(selectQuery, new Object[]{p_group},new RowMapper<Pension>(){

			@Override
			public Pension mapRow(ResultSet rs, int rowNo) throws SQLException {
				Pension pension=null;
				try{
				 pension=new Pension(rs.getInt("p_code"),
						 			 rs.getString("p_group"),
						 			 rs.getString("p_name"),
						 			 rs.getString("p_address"),
						 			 rs.getString("p_tel"),
						 			 rs.getString("p_image"),
						 			 rs.getString("p_site"));
				}catch(Exception e){
					
				}
				return pension; 	
			}
			
		});
	}

	
	// 모든 펜션 뿌리기
	@Override
	public List<Pension> findAllPension() throws Exception {
		System.out.println("#### PensionDaoSpringJDBC : findAllPension()메쏘드 호출  ");	
		String selectQuery = "select * from pension";
		return jdbcTemplate.query(selectQuery, new Object[]{},new RowMapper<Pension>(){

			@Override
			public Pension mapRow(ResultSet rs, int rowNo) throws SQLException {
				Pension pension=null;
				try{
				 pension=new Pension(rs.getInt("p_code"),
						 			 rs.getString("p_group"),
						 			 rs.getString("p_name"),
						 			 rs.getString("p_address"),
						 			 rs.getString("p_tel"),
						 			 rs.getString("p_image"),
						 			 rs.getString("p_site"));
				}catch(Exception e){
					
				}
				return pension; 	
			}
			
		});
	}

}
