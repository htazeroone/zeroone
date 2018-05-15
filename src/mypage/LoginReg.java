package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class LoginReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		String pid = request.getParameter("pid");
		String pw = request.getParameter("pw");
		String pname = "";

		String msg = "아이디와 비밀번호를 확인해주세요 ";
		String url = "login.jsp";
		DAO dao = new DAO();
		VO vo = new VO();
		vo.setPid(pid);
		vo.setPw(pw);
		pname = dao.loginReg(vo);

		//loginReg결과, pname에  "" 또는 값이 넘어온다
		if(!pname.equals("")) {
			 msg = "로그인성공";
			 url = "index.html";
		}

		dao.close();

		request.setAttribute("pname", pname);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "alert.jsp");

		return new ActionData();
	}

}
