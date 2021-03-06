package pet.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.RdbmsDAO;

public class PetDAO extends RdbmsDAO 
{
	private static PetDAO _petDao;

	private PetDAO() {}

	public static PetDAO getPetDAO() 
	{
		if (_petDao == null)
		{
			_petDao = new PetDAO();
		}
		return _petDao;
	}

	// 새로운 고양이 입력

	public int insert(PetDTO petDto) throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String insert = "insert into cat (c_code,	c_part_code,	c_part, c_name_code,	c_name,	c_sex,	c_price)	values(?, ?, ?, ?, ?, ?, ?);";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(insert);
			pstmt.setInt(1, petDto.getC_code());
			pstmt.setString(2, petDto.getC_part_code());
			pstmt.setString(3, petDto.getC_part());
			pstmt.setString(4, petDto.getC_name_code());
			pstmt.setString(5, petDto.getC_name());
			pstmt.setString(6, petDto.getC_sex());
			pstmt.setInt(7, petDto.getC_price());

			int row = pstmt.executeUpdate();

			return row;
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				releaseConnection(con);
			}
		}

	}

	// 고양이 번호로 삭제
	public int remove(int c_code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String delete = "delete from cat where c_code=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(delete);
			pstmt.setInt(1, c_code);
			int row = pstmt.executeUpdate();

			return row;
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				releaseConnection(con);
			}
		}

	}

	// 고양이 한마리 찾기 :: c_code로 찾기
	public PetDTO findPet(int c_code) throws Exception {
		PetDTO petDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String findPet = "select c_code ,c_part_code ,c_part ,c_name_code ,"
				+ "c_name ,c_sex ,c_price from cat where c_code=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(findPet);
			pstmt.setInt(1, c_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				petDto = new PetDTO(rs.getInt("c_code"),
						rs.getString("c_part_code"), rs.getString("c_part"),
						rs.getString("c_name_code"), rs.getString("c_name"),
						rs.getString("c_sex"), rs.getInt("c_price"));

				return petDto;
			}

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				releaseConnection(con);
			}
		}

		return petDto;
	}
	
	// 고양이 한마리 찾기 c_name_code로 찾기
		public PetDTO findPet(String c_name_code) throws Exception {
			PetDTO petDto = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String findPet = "select c_code ,c_part_code ,c_part ,c_name_code ,"
					+ "c_name ,c_sex ,c_price from cat where c_name_code=?";

			try {
				con = getConnection();
				pstmt = con.prepareStatement(findPet);
				pstmt.setString(1, c_name_code);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					petDto = new PetDTO(rs.getInt("c_code"),
							rs.getString("c_part_code"), rs.getString("c_part"),
							rs.getString("c_name_code"), rs.getString("c_name"),
							rs.getString("c_sex"), rs.getInt("c_price"));

					return petDto;
				}

			} finally {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
				if (con != null) {
					releaseConnection(con);
				}
			}

			return petDto;
		}

	// 고양이 그룹별 찾기 리스트
	public ArrayList<PetDTO> findGroupPet(String c_part_code) throws Exception {
		ArrayList<PetDTO> groupPet = new ArrayList<PetDTO>();
		PetDTO petDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String findList = "select c_code ,c_part_code ,c_part ,c_name_code ,"
				+ "c_name ,c_sex ,c_price from cat where c_name_code=? order by c_code";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(findList);
			pstmt.setString(1, c_part_code);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				groupPet.add(petDto = new PetDTO(rs.getInt("c_code"), rs
						.getString("c_part_code"), rs.getString("c_part"), rs
						.getString("c_name_code"), rs.getString("c_name"), rs
						.getString("c_sex"), rs.getInt("c_price")));
			}
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				releaseConnection(con);
			}
		}
		return groupPet;
	}
	
	// 고양이 이름으로 찾기
		public ArrayList<PetDTO> findNamePet(String c_name) throws Exception {
			ArrayList<PetDTO> findnamePet = new ArrayList<PetDTO>();
			PetDTO petDto = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String findList = "select c_code ,c_part_code ,c_part ,c_name_code ,"
					+ "c_name ,c_sex ,c_price from cat where c_name like '%'||?||'%' order by c_code";
			try {
				con = getConnection();
				pstmt = con.prepareStatement(findList);
				pstmt.setString(1, c_name);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					findnamePet.add(petDto = new PetDTO(rs.getInt("c_code"), rs
							.getString("c_part_code"), rs.getString("c_part"), rs
							.getString("c_name_code"), rs.getString("c_name"), rs
							.getString("c_sex"), rs.getInt("c_price")));
				}
			} finally {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
				if (con != null) {
					releaseConnection(con);
				}
			}
			return findnamePet;
		}

	// 전체 고양이 찾기
	public ArrayList<PetDTO> petList() throws Exception {
		ArrayList<PetDTO> petList = new ArrayList<PetDTO>();
		PetDTO petDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String allList = "select * from cat order by c_code";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(allList);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				petList.add(petDto = new PetDTO(rs.getInt("c_code"), rs
						.getString("c_part_code"), rs.getString("c_part"), rs
						.getString("c_name_code"), rs.getString("c_name"), rs
						.getString("c_sex"), rs.getInt("c_price")));

			}
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				releaseConnection(con);
			}
		}
		return petList;
	}

}
