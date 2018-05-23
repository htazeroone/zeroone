package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class ProblemSave implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		DAO dao = new DAO();
		VO vo = new VO();
		Integer chid = Integer.parseInt((String)request.getSession().getAttribute("num"));
		String pid = (String)request.getSession().getAttribute("pid");

		vo.setChid(chid);
		vo.setPid(pid);
		
		for(int i=1; i<=4; i++) {

			if(request.getParameter("save"+i)!=null) {
				vo.setId(Integer.parseInt(request.getParameter("id"+i)));
				vo.setSave(1);
				dao.problem_save(vo);			
		}
			else {
				vo.setId(Integer.parseInt(request.getParameter("id"+i)));
				vo.setSave(0);
				dao.problem_save(vo);
			}
		}

		request.setAttribute("problem", dao.question(chid));
		request.setAttribute("result", dao.result(pid,chid));
		request.setAttribute("menu", "quizmenu.jsp");
		request.setAttribute("main1", "quizbox/problem.jsp");
		request.setAttribute("main2", "quizbox/answer.jsp");
		
		dao.close();
		
		return data;
	}

}
