package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Chapter1Answer implements Action{
	
@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	ActionData data = new ActionData();
	DAO dao = new DAO();
	Integer chid = Integer.parseInt((String)request.getSession().getAttribute("num"));
	
	
	for(int i=1; i<=4; i++) {

		VO vo = new VO(); 	
		vo.setChid(chid);
		vo.setId(Integer.parseInt(request.getParameter("id"+i)));
		vo.setInput(request.getParameter("selection"+Integer.parseInt(request.getParameter("id"+i))));	
		if(request.getParameter("selection"+Integer.parseInt(request.getParameter("id"+i))).equals(dao.question(chid).get(i-1).getAnswer())) {
			vo.setOx(1);
		}else {
			vo.setOx(0);
		}
		dao.insertresult(vo);
	}

	request.setAttribute("problem", dao.question(chid));
	request.setAttribute("result", dao.result(chid));
	request.setAttribute("menu", "quizmenu.jsp");
	request.setAttribute("main1", "quizbox/chapter1.jsp");
	request.setAttribute("main2", "quizbox/chapter1answer.jsp");
	
	dao.close();
	return data;	
	
	}	

}
