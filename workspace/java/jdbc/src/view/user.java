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
