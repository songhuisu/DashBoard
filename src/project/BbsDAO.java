package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.Bbs;

public class BbsDAO {

	private Connection con;
	private ResultSet rs;
	private PreparedStatement pst;

	public BbsDAO() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String uid = "song";
			String upw = "adminsong";

			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, upw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getNext() {

		String SQL = "SELECT bbsid FROM board  ORDER By bbsid DESC";

		try {

			pst = con.prepareStatement(SQL);

			rs = pst.executeQuery();

			if (rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;// 첫 번째 게시물인 경우

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}


	public int write(Bbs bbs) {

		String SQL = "INSERT INTO board VALUES (dash_bbsnumber.nextVal, ?, ?, ?,?,?,?)";

		try {

			pst = con.prepareStatement(SQL);

			pst.setString(1, bbs.getBbsTitle());
			pst.setString(2, bbs.getBbsContent());
			pst.setInt(3, bbs.getBbsPercent());
			pst.setString(4, bbs.getBbsStartDate());
			pst.setString(5, bbs.getBbsLastDate());
			pst.setString(6, bbs.getBbsUser());
			return pst.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {

			}
		}

		return -1; // 데이터베이스 오류

	}

	public ArrayList<Bbs> upload() {

		String SQL = "SELECT bbsid,bbstitle,bbscontent,bbspercent,bbsstartdate,bbslastdate FROM board order by bbsid DESC";

		ArrayList<Bbs> upload = new ArrayList<Bbs>();

		try {
			pst = con.prepareStatement(SQL);

			rs = pst.executeQuery();

			while (rs.next()) {
				Bbs up = new Bbs();

				up.setBbsID(rs.getInt(1));
				up.setBbsTitle(rs.getString(2));
				up.setBbsContent(rs.getString(3));
				up.setBbsPercent(rs.getInt(4));
				up.setBbsStartDate(rs.getString(5));
				up.setBbsLastDate(rs.getString(6));

				upload.add(up);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return upload;
	}

	public ArrayList<Bbs> Chart_data(String id) {

		String SQL = "SELECT * FROM board where bbsuser = ?";

		ArrayList<Bbs> data = new ArrayList<Bbs>();

		try {
			pst = con.prepareStatement(SQL);
			pst.setString(1, id);
		
			rs = pst.executeQuery();

			while (rs.next()) {
				Bbs up = new Bbs();

				up.setBbsID(rs.getInt(1));
				up.setBbsTitle(rs.getString(2));
				up.setBbsContent(rs.getString(3));
				up.setBbsPercent(rs.getInt(4));
				up.setBbsStartDate(rs.getString(5));
				up.setBbsLastDate(rs.getString(6));

				data.add(up);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return data;
	}

	public Bbs getSelectedData(int id) {
		String SQL = "SELECT * FROM board Where bbsId = ?";

		Bbs up = new Bbs();

		try {
			pst = con.prepareStatement(SQL);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				up.setBbsID(rs.getInt(1));
				up.setBbsTitle(rs.getString(2));
				up.setBbsContent(rs.getString(3));
				up.setBbsPercent(rs.getInt(4));
				up.setBbsStartDate(rs.getString(5));
				up.setBbsLastDate(rs.getString(6));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return up;
	}
	
	public ArrayList<Bbs> getChardata(String id){
		String SQL = "SELECT * FROM board Where bbsId = ?";

		ArrayList<Bbs> dtos = new ArrayList<Bbs>();
		
		try {
			pst = con.prepareStatement(SQL);
			pst.setString(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				Bbs up = new Bbs();
				
				up.setBbsID(rs.getInt(1));
				up.setBbsTitle(rs.getString(2));
				up.setBbsContent(rs.getString(3));
				up.setBbsPercent(rs.getInt(4));
				up.setBbsStartDate(rs.getString(5));
				up.setBbsLastDate(rs.getString(6));
				up.setBbsUser(rs.getString(6));
				
				dtos.add(up);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return dtos;
	}

	/*
	 * public boolean nextPage(int pageNumber) {
	 * 
	 * String SQL =
	 * "SELECT * FROM board WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"
	 * ;
	 * 
	 * try {
	 * 
	 * PreparedStatement pstmt = con.prepareStatement(SQL);
	 * 
	 * pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) {
	 * 
	 * return true;
	 * 
	 * }
	 * 
	 * } catch (Exception e) {
	 * 
	 * e.printStackTrace();
	 * 
	 * }finally { try { if (pst != null) { pst.close(); } if (con != null) {
	 * con.close(); } } catch (Exception e) {
	 * 
	 * } }
	 * 
	 * return false;
	 * 
	 * }
	 */

	public int update(int bbsID, String bbsTitle, String bbsContent, int bbsPercent, String bbsStartDate,
			String bbsLastDate) {

		String SQL = "UPDATE board SET bbsTitle = ?, bbsContent = ?, bbsPercent = ?, bbsStartDate = ?, bbsLastDate = ? WHERE bbsID = ?";

		try {

			pst = con.prepareStatement(SQL);

			pst.setString(1, bbsTitle);
			pst.setString(2, bbsContent);
			pst.setInt(3, bbsPercent);
			pst.setString(4, bbsStartDate);
			pst.setString(5, bbsLastDate);
			pst.setInt(6, bbsID);

			return pst.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {

			}
		}

		return -1; // 데이터베이스 오류

	}

	
	public int delete(int bbsID) {

		String SQL = "Delete from board WHERE bbsID = ?";

		try {
			pst = con.prepareStatement(SQL);   
			pst.setInt(1, bbsID);
			
			pst.executeUpdate();
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	return "";
	}
}
