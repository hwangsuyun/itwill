package com.itwill.member;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MemberRowMapper implements RowMapper<Member> {

	
	public Member mapRow(ResultSet rs, int rowNo) throws SQLException {
			return new Member(rs.getString("id"),
						rs.getString("passwd"),
						rs.getString("name"),
						rs.getString("email1"),
						rs.getString("email2"));

	}

}
