package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class ManageMember implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		DAO dao = new DAO();
		
		request.setAttribute("memberList", dao.getMembers());
		request.setAttribute("main", "mypage/memberList.jsp");
		
		dao.close();
		return new ActionData();
		
	}
}
