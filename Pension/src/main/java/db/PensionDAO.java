package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

public class PensionDAO {

	// 오라클에 접속하는 소스를 작성
	String id = "SCOTT";
	String pass = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	Connection con; // 데이터베이스에 접근할수 있도록 설정
	PreparedStatement pstmt; // 데이터베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs;

	// 데이터 베이스에 접근할수 있도록 도와주는 메소드
	public void getCon() {

		try {
			// 1.해당 데이터 베이스를 사용한다고 선언(클래스를 등록=오라클용을 사용)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2.해당 데이터베이스에 접속
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 모든 이미 예약된 펜션을 검색하는 매소드
	public Vector<PensionBean> getAllPension() {
		// 리턴 타입을 설정
		Vector<PensionBean> v = new Vector<>();
		// 데이터를 저장할 빈 클래스 선언
		PensionBean bean = null;

		getCon();// 커넥션이 연결되어야 쿼리를 실행가능

		try {
			String sql = "select * from Pension where status=1";
			pstmt = con.prepareStatement(sql);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 데이터를 저장
			while (rs.next()) {
				// 데이터를 저장할 빈클래스 생성
				bean = new PensionBean();

				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCall(rs.getString(3));
				bean.setLocation(rs.getInt(4));
				bean.setPrice(rs.getInt(5));
				bean.setPeople(rs.getInt(6));
				bean.setImage(rs.getString(7));
				bean.setMonth(rs.getInt(8));
				bean.setInfo(rs.getString(9));
				bean.setLocation2(rs.getString(10));
				bean.setAccount(rs.getString(11));
				bean.setStatus(rs.getInt(12));
				bean.setCode(rs.getString(13));
				bean.setPhone(rs.getString(14));
				// 벡터에 빈 클래스를 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// 하나의 펜션 정보를 리턴하는 매소드 id로
	public PensionBean getOnePension(int id) {
		// 리턴 타입 선언
		PensionBean bean = new PensionBean();
		getCon();

		try {
			String sql = "select * from Pension where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 데이터를 저장
			while (rs.next()) {
				bean = new PensionBean();

				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCall(rs.getString(3));
				bean.setLocation(rs.getInt(4));
				bean.setPrice(rs.getInt(5));
				bean.setPeople(rs.getInt(6));
				bean.setImage(rs.getString(7));
				bean.setMonth(rs.getInt(8));
				bean.setInfo(rs.getString(9));
				bean.setLocation2(rs.getString(10));
				bean.setAccount(rs.getString(11));
				bean.setStatus(rs.getInt(12));
				bean.setCode(rs.getString(13));
				bean.setPhone(rs.getString(14));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 코드로 하나의 펜션 정보를 리턴하는 메소드
	public PensionBean getOnePension2(String code) {

		// 리턴 타입 선언
		PensionBean bean = new PensionBean();
		getCon();

		try {

			String sql = "select * from Pension where code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 데이터를 저장
			while (rs.next()) {
				bean = new PensionBean();

				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCall(rs.getString(3));
				bean.setLocation(rs.getInt(4));
				bean.setPrice(rs.getInt(5));
				bean.setPeople(rs.getInt(6));
				bean.setImage(rs.getString(7));
				bean.setMonth(rs.getInt(8));
				bean.setInfo(rs.getString(9));
				bean.setLocation2(rs.getString(10));
				bean.setAccount(rs.getString(11));
				bean.setStatus(rs.getInt(12));
				bean.setCode(rs.getString(13));
				bean.setPhone(rs.getString(14));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 지역별 아직 예약되지 않은 펜션 리스트
	public Vector<PensionBean> getPensionByRegion(int category) {
		// 리턴 타입을 설정
		Vector<PensionBean> v = new Vector<>();
		// 데이터를 저장할 빈 클래스 선언
		PensionBean bean = null;

		getCon();// 커넥션이 연결되어야 쿼리를 실행가능

		try {
			String sql = "SELECT * FROM Pension WHERE location = ? AND status = 0";
			pstmt = con.prepareStatement(sql);
			// ?
			pstmt.setInt(1, category);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 데이터를 저장
			while (rs.next()) {
				// 데이터를 저장할 빈클래스 생성
				bean = new PensionBean();

				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCall(rs.getString(3));
				bean.setLocation(rs.getInt(4));
				bean.setPrice(rs.getInt(5));
				bean.setPeople(rs.getInt(6));
				bean.setImage(rs.getString(7));
				bean.setMonth(rs.getInt(8));
				bean.setInfo(rs.getString(9));
				bean.setLocation2(rs.getString(10));
				bean.setAccount(rs.getString(11));
				bean.setStatus(rs.getInt(12));
				bean.setCode(rs.getString(13));
				bean.setPhone(rs.getString(14));

				// 벡터에 빈 클래스를 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// 월별 아직 예약되지 않은 펜션 리스트
	public Vector<PensionBean> getPensionByMonth(int category) {
		// 리턴 타입을 설정
		Vector<PensionBean> v = new Vector<>();
		// 데이터를 저장할 빈 클래스 선언
		PensionBean bean = null;

		getCon();// 커넥션이 연결되어야 쿼리를 실행가능

		try {
			String sql = "SELECT * FROM Pension WHERE month = ? AND status = 0";
			pstmt = con.prepareStatement(sql);
			// ?
			pstmt.setInt(1, category);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 데이터를 저장
			while (rs.next()) {
				// 데이터를 저장할 빈클래스 생성
				bean = new PensionBean();

				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCall(rs.getString(3));
				bean.setLocation(rs.getInt(4));
				bean.setPrice(rs.getInt(5));
				bean.setPeople(rs.getInt(6));
				bean.setImage(rs.getString(7));
				bean.setMonth(rs.getInt(8));
				bean.setInfo(rs.getString(9));
				bean.setLocation2(rs.getString(10));
				bean.setAccount(rs.getString(11));
				bean.setStatus(rs.getInt(12));
				bean.setCode(rs.getString(13));
				bean.setPhone(rs.getString(14));

				// 벡터에 빈 클래스를 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// status를 0에서 1로 바꿔주는 메소드
	public void changeStatus(int id) {

		getCon();

		try {

			String sql = "update Pension set status=1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}

	// status를 1에서 0로 바꿔주는 메소드
	public void changeStatus0(int id) {

		getCon();

		try {

			String sql = "update Pension set status=0 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}

	// 데이터베이스에 생성된 코드 넣는 메소드
	public void inputCode(String code, int id) {

		getCon();

		try {

			String sql = "update Pension set code=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setInt(2, id);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 데이터베이스에 넣은 코드에 다시 0넣기
	public void inputCode0(int id) {

		getCon();

		try {

			String sql = "update Pension set code=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, id);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 전화번호 넣기
	public void inputPhone(String phone, int id) {

		getCon();

		try {

			String sql = "update Pension set phone=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			pstmt.setInt(2, id);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 전화번호에 다시 0넣기
	public void inputPhone0(int id) {

		getCon();

		try {

			String sql = "update Pension set phone=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, id);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
