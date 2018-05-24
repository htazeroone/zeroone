package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class KickOut implements Action {
	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		DAO dao = new DAO();
		
		dao.kickOutMember(request.getParameter("pid"));
		
		request.setAttribute("memberList", dao.getMembers());
		request.setAttribute("msg", request.getParameter("pid")+"님을 강퇴시키겠습니까?");
		request.setAttribute("main", "mypage/memberList.jsp");
		dao.close();
		return new ActionData();
	}
}
