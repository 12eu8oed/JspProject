package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

public class LocationInfoDAO {

	// 오라클에 접속하는 소스를 작성
	String id = "SCOTT";
	String pass = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	Connection con; // 데이터베이스에 접근할수 있도록 설정
	PreparedStatement pstmt; // 데이터베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs; // 데이터베이스의 테이블의 결과를 리턴받아 저장

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

	public LocationInfoBean getLocation(int region) {

		// 리턴 타입 선언
		LocationInfoBean bean = new LocationInfoBean();
		getCon();

		try {

			String sql = "select * from LOCATIONINFO where location = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, region);

			// 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 데이터를 저장
			while (rs.next()) {
				bean = new LocationInfoBean();

				bean.setLocation(rs.getInt(1));
				bean.setLocationName(rs.getString(2));
				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

}
