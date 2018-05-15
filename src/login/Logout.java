package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class Logout implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		String msg = "로그아웃 성공!";
		String url = "../main/Main";

		System.out.println("pname:"+request.getAttribute("pname"));
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("pname", null);
		request.setAttribute("main", "mypage/alert.jsp");
		return new ActionData();
	}
}
