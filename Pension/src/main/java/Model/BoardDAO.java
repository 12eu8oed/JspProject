package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class BoardDAO{
	ResultSet rs; // 데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
	Connection conn;//데이터베이스에 접근할수 있도록 설정 
	PreparedStatement pstmt;//데이터 베이스에서 쿼리를 실행시켜주는 객체 

	public void getcon() {  //DB연결
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "scott";
			String dbPassword = "tiger";
			
			 // 환경 변수 설정 (윈도우용 예시)
            System.setProperty("oracle.jdbc.defaultNChar", "true");
            System.setProperty("NLS_LANG", "KOREAN_KOREA.AL32UTF8");
			
            //드라이버 등록 연결 설정
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//추천수를 업데이트하는 메소드
	public boolean updateRecommend(int num) {
	    boolean result = false; // 업데이트 성공 여부를 저장할 변수
	    getcon(); // DB 연결 메소드 호출

	    try {
	        // 추천수를 1 증가시키는 쿼리문
	        String sql = "UPDATE board2 SET likes = likes + 1 WHERE num = ?"; 
	        pstmt = conn.prepareStatement(sql); // 쿼리문 준비
	        pstmt.setInt(1, num); // 쿼리문의 첫 번째 물음표에 게시글 번호(num)를 대입

	        // 쿼리문 실행 후 영향받은 행의 개수를 저장
	        int rowCount = pstmt.executeUpdate();

	        // 영향받은 행의 개수가 0 초과면 업데이트 성공
	        if (rowCount > 0) {
	            result = true;
	        }

	        conn.close(); // DB 연결 종료

	    } catch (Exception e) {
	        e.printStackTrace(); // 오류 출력
	    }

	    return result; // 업데이트 성공 여부 반환
	}
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean){
		getcon();
		
		//빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref = 0;// 글 그룹을 의미 = 쿼리를 실행시켜 가장큰 ref 값을 가져온후 +1을 더해주면 된다 
		int re_step = 1;//새글이기에 = 부모 글이기에
		int re_level = 1;
		int likes = 0;//추천수의 기본값은 0이다.
		
		try {
			//가장큰 ref값을 읽어오는 쿼리 준비 
			String refSQL = "SELECT max(ref) FROM BOARD2";
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(refSQL);
			//쿼리를 실행후 결과를 리턴
			rs = pstmt.executeQuery();	
			if(rs.next()){//결과 값이 있다면
				ref = rs.getInt(1)+1;//최대 값에 +1을 더해서 글 그룹을 설정
			}
			//실제로 게시글 전체값을 테이블에 저장 
			String SQL = "INSERT INTO BOARD2 VALUES(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?,?)";
			pstmt = conn.prepareStatement(SQL);
	        
			//?의 값을 맵핑
			pstmt.setString(1, bean.getWrite());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			pstmt.setInt(9, likes);

			//쿼리를 실행하시오
			pstmt.executeUpdate();	
			//자원 반납
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();	
		}	
	}


	//모든 게시글을 리턴해 주는 리소스
	public Vector<BoardBean> getAllBoard(int start , int end){
		//리턴할 객체 선언 
		Vector<BoardBean> v = new Vector<>();
		getcon();
		try {
			//쿼리 준비 
			String SQL = "select * from (select A.* ,Rownum Rnum from (select *from board2 order by ref desc ,re_step asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";

			//쿼리실행 객체 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);

			//쿼리를 실행후 결과를 저장
			rs = pstmt.executeQuery();	

			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출 
			while(rs.next()){
				//데이터를 패키징(가방 = Boardbean클래스를 이용)해줌
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_stop(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				bean.setLikes(rs.getInt(12));


				//패키징한 데이터를 벡터에 저장 
				v.add(bean);
			}

			conn.close();

		}catch(Exception e) {
			e.printStackTrace();	
		}	

		return v;
	}

	//BoardInfo 하나의 게시글 리턴하는 메소드
	public BoardBean getOneBoard(int num){	
		//리턴 타입 선언
		BoardBean bean = new BoardBean();
		getcon();
		try {
			//조회수 증가 쿼리 
			String readsql = "update board2 set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();	

			//쿼리준비
			String SQL = "select * from board2 where num=?";
			//쿼리실행객체 
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();

			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_stop(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				bean.setLikes(rs.getInt(12));

			}

			conn.close();
		}catch(Exception e) {
			e.printStackTrace();

		}
		return bean;
	}

	//답변글이 저장되는 메소드 
	public void reWriteBoard(BoardBean bean){
		//부모글 그룹과 글레벨 글 스템을 읽어드림 
		int ref =bean.getRef();
		int re_stop = bean.getRe_stop();
		int re_level = bean.getRe_level();

		getcon();

		try { 
			//부모글 보다 큰 re_level의 값을 전부 1씩 증가시켜줌 
			String  levelsql = "update board2 set re_level=re_level+1 where ref=? and re_level > ?";
			//쿼리 삽입 객체 선언 
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1 , ref);
			pstmt.setInt(2 , re_level);
			//쿼리 실행 
			pstmt.executeUpdate();
			//답변글 데이터를 저장
			String sql ="insert into board2 values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?,0)";
			pstmt = conn.prepareStatement(sql);
			//?에 값을 대입
			pstmt.setString(1, bean.getWrite());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);//부모의 ref 값을 넣어줌 
			pstmt.setInt(6, re_stop+1);//답글이기에 부모글 re_stop에 1을 넣어줌 
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, bean.getContent());

			//쿼리를 실행하시오
			pstmt.executeUpdate();	
			conn.close();

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	//Boardupdate용 Delete시 하나의 게시글을 리턴
	public BoardBean getOneUpdateBoard(int num){	
		//리턴 타입 선언
		BoardBean bean = new BoardBean();
		getcon();
		try {
			//쿼리준비
			String SQL = "select * from board2 where num=?";
			//쿼리실행객체 
			//쿼리실행 객체 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();

			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_stop(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				bean.setLikes(rs.getInt(12));

			}

			conn.close();
		}catch(Exception e) {
			e.printStackTrace();

		}
		return bean;
	}

	//update 와 delete시 필요한 패스워드 값을 리턴해 주는 메소드
	public String getPass(int num) {
		//리턴할 변수 객체 선언 
		String pass = "";
		getcon();

		try {		
			//쿼리 준비 
			String sql = "select password from board2 where num=?";

			//쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);

			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();

			//패스워드 값을 저장
			if(rs.next()) {
				pass = rs.getString(1);	
			}

			//자원 반납
			conn.close();

		}catch(Exception e) {
			e.printStackTrace();
		}

		return pass;
	}

	//하나의 게시글을 수정하는 메소드
	public void updateBoard(BoardBean bean){
		getcon();

		try {		
			//쿼리 준비 
			String sql = "update board2 set subject=? , content= ? where num = ?";

			//쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,bean.getSubject());
			pstmt.setString(2,bean.getContent());
			pstmt.setInt(3,bean.getNum());

			//쿼리 실행후 결과를 리턴
			pstmt.executeUpdate();

			//자원 반납
			conn.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//하나의 게시글을 삭제하는 매소드
	public void deleteBoard(int num) {
		getcon();
		int flag = 1;
		try {		
			//쿼리 준비 
			String sql = "delete from board2 where num=?";

			//쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			//?
			pstmt.setInt(1,num);

			//쿼리 실행
			pstmt.executeUpdate();

			//자원 반납
			conn.close();

		}catch(Exception e) {
			e.printStackTrace();

		}
	}


	public int getAllCount(){
		getcon();

		//게시글 전체수를 저장하는 변수 
		int count = 0;

		try {		
			//쿼리 준비 
			String sql = "select count(*) from board2";

			//쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);

			//쿼리 실행후 결과를 리턴 
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}

			//자원 반납
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}

		return count;
	}
}