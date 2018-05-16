package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class Detail implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		request.setAttribute("data", dao.qdetail(id));
		request.setAttribute("main", "info/detail.jsp");
		
		dao.close();
		return data;
	}

}
