# Day 35 - JDBC 로그인, 회원가입
> 이클립스에 DB연결이 안되는게 너무 스트레스 받아서 받아적기만함

```java
//TBL_MEMBER_DAO.java : 회원가입, 로그인, 암호화
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
public class TBL_MEMBER_DAO {
	
	Connection conn;
	PrepareStatement pstm;
	ResultSet rs;
	
	private static final int KEY =3;
	
	//중복검사
	//사용자 입력한 아S이디를 전달 받는다.
	public boolean checkId(String id) {
		//사용자가 입력한 아이디와 일치하는 개수를 가져온다.
		
	String query = "SELECT COUNT(ID) FROM TBL_MEMBER WHERE ID = ? ";
	boolean check = false;
	try {	
		
			//드라이버 연결을 통해 커넥션 객체를 가져온다.
			conn = DBConnecter.getConnection();
			//입력한 쿼리문을 pstm에 담아준다.
			pstm = conn.prepareStatement(query);
			//?를 채워준다 (좌에서 우로 1부터 시작)
			pstm.setString(1,id);
			//쿼리문 실행 후 결과를 rs에 담아준다.
			rs = pstm.ececuteQuery();
			
			//행 가져오기
			rs.next();
			//열 가져오기
			if(rs.getInt(1)==0){return true;}//0이면 중복이없다. 1이면 중복이있다.
		} catch (SQLEException e) {
			e.printStackTrace();
		}finally {
			try {
				if {conn != null){
					rs.close();
				}
				if(pstm != null) {
					pstm.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		
		return check;
	}
	//회원가입
	public boolean join(TBL_MEMEBER_VO member) {
		String query = "INSERT INTO TBL_MEMBER" + 
	"(NUM,ID,PW,NAME,AGE)"+
				"VALUES(MEMBER_SEQ.NEXTVAL,?,?,?,?)";
		boolean check =false;
		try {
			conn = DBConnecter.getConnection();
			pstm = conn.prepareStatement(query);
			pstm.setString(1,member.getId());
			pstm.setString(2,member.encrypt(member.getPw()));
			pstm.setString(3,member.getName());
			pstm.setInt(4,member.getAge());
			if(pstm.executeUpdate()==1) {check= true;}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstm!=null) {
					pstm.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch (SQLException e) {
				throw new RuntimeException();
			}
		}
		return check;
	}
	

	//로그인
	public boolean login (String id, String pw) {
		String query = "SELECT COUNT(ID) FROM TBL_MEMBER"
							+"WHERE ID = ? AND PW =?";
		boolean check =false;
		try {
			conn = DBConnecter.getConnection();
			pstm = conn.prepareStatement(query);
			pstm.setString(1,id);
			pstm.setString(2,encrypt(pw));
			rs=pstm.executeQuery();
			
			rs.next();
			if(rs.getInt(1)==1) {check =true;}
		
		
	}catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
			if(pstm!=null) {
				pstm.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}catch (SQLException e) {
			throw new RuntimeException();
		}
	}
		return check;
	}
	
	//단방향 암호화
	pulbic String encrypt() {
			String en_pw = "";
			for (int i=0; i<pw.length();i++) {
				en_pw+=(char)(pw.charAt(i)+KEY);
			}
			return en_pw;
		}
		}
	
	
	

```



```java
//user.java 잘돌아가는지 확인코드
package view;

import dao.TBL_MEMBER_DAO;
import vo.TBL_MEMBER_VO;

public class user {
	public static void main(String[] args) {
		TBL_MEMBER_DAO dao = new TBL_MEMBER_DAO();
		
		if(dao.login("hds1234", "1234")) {
			System.put.println("로그인성공");
		}else {
			System.put.println("로그인 실패");
		}
		
		
//		if(dao.checkId("hds1234")) {
//			System.out.println("사용가능 아이디");
//		}else {
//			System.out.println("중복된 아이디");
//		}
//		
		
		
		
//		TBL_MEMBER_VO vo = new TBL_MEMBER_VO();
//		vo.setId("hds1234");
//		vo.setPw("1234");
//		vo.setName("한동석");
//		vo.setAge(20);
//		
//		if(dao.join(vo)) {
//			System.out.println("회원가입 성공");
//		}else {
//			System.out.println("회원가입 실패");
//		}
	}
}

```