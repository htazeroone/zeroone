package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class Test implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		ActionData data = new ActionData();
		DAO dao = new DAO();
		
		request.setAttribute("data",dao.replylist(1));
		request.setAttribute("main", "test.jsp");
		
		dao.close();
		return data;
	}
}
