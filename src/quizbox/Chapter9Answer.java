package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class Chapter9Answer implements Action{
	
@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	ActionData data = new ActionData();
	DAO dao = new DAO();
	Integer chid = Integer.parseInt((String)request.getSession().getAttribute("num"));
 	
	request.setAttribute("problem", dao.question(chid));
	request.setAttribute("menu", "quizmenu.jsp");
	request.setAttribute("main1", "quizbox/chapter9.jsp");
	request.setAttribute("main2", "quizbox/chapter9answer.jsp");
	dao.close();
	return data;	
	
	}	

}
