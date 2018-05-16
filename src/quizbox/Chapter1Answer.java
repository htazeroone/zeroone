package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class Chapter1Answer implements Action{
	
@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	ActionData data = new ActionData();

	request.setAttribute("menu", "quizmenu.jsp");
	request.setAttribute("main1", "quizbox/chapter1.jsp");
	request.setAttribute("main2", "quizbox/chapter1answer.jsp");
	
	return data;	
	
	}	

}
