package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection con; // �����ͺ��̽��� �����ϱ� ���� ��ü
	private PreparedStatement pst;
	private ResultSet rs; // ������ ���� �� �ִ� ������ ������ش�.

	public UserDAO() {
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

	public int login(User user) {

		String SQL = "SELECT jpw FROM dashmember WHERE jid = ?";

		try {

			pst = con.prepareStatement(SQL);

			pst.setString(1, user.getJid());

			rs = pst.executeQuery();

			if (rs.next()) {

				if (rs.getString(1).equals(user.getJpw())) {

					return 1; // �α��� ����
				}
			} else {

				return 0; // ��й�ȣ ����ġ
			}

			return -1; // ���̵����

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {

			}
		}
		return -2;

	}

	public int join(String jid,String jpw,String jrepass,String jName,String jEmail) {

		String SQL = "INSERT INTO dashmember VALUES (?,?,?,?,?)";

		try {

			pst = con.prepareStatement(SQL);

			pst.setString(1,jid);
			pst.setString(2, jpw);
			pst.setString(3,jrepass);
			pst.setString(4,jName);
			pst.setString(5,jEmail);
			
			pst.executeUpdate();

			return 1;

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
		return 0;
	}
}
