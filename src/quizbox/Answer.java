package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Answer implements Action{
	
@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	ActionData data = new ActionData();
	DAO dao = new DAO();
	Integer chid = Integer.parseInt((String)request.getSession().getAttribute("num"));
	String pid = (String)request.getSession().getAttribute("pid");

	VO vo = new VO(); 	
	vo.setPid(pid);
	vo.setChid(chid);
	
	for(int i=1; i<=4; i++) {
		vo.setId(Integer.parseInt(request.getParameter("id"+i)));
		vo.setInput(request.getParameter("selection"+Integer.parseInt(request.getParameter("id"+i))));	
		if(request.getParameter("selection"+Integer.parseInt(request.getParameter("id"+i))).equals(dao.question(chid).get(i-1).getAnswer())) {
			vo.setOx(1);
		}else {
			vo.setOx(0);
		}

		dao.insert_result(vo);
	}

	request.setAttribute("problem", dao.question(chid));
	request.setAttribute("result", dao.result(pid, chid));
	request.setAttribute("menu", "quizmenu.jsp");
	request.setAttribute("main1", "quizbox/problem.jsp");
	request.setAttribute("main2", "quizbox/answer.jsp");
	
	dao.close();
	return data;	
	
	}	

}
