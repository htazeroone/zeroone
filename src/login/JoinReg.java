package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class JoinReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("JoinReg 진입");
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");

		String msg = "아이디가 중복됩니다 ";
		String url = "../login/JoinForm";

		DAO dao = new DAO();

		//중복이 되면 false
		boolean pidRes = dao.pidChk(pid);

		VO vo = new VO();

		//비밀번호가 둘이 일치하고 중복이 아니어서 true라면 회원가입시킨다
		if(pidRes==true ) {
			vo.setPid(pid);
			vo.setPname(pname);
			vo.setPw(pw1);
			dao.join(vo);

			 msg = "회원가입성공";
			 url = "../main/Main";
		}

		dao.close();

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "mypage/alert.jsp");

		return new ActionData();
	}

}
