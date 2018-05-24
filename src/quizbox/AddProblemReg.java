package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class AddProblemReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		
		VO vo = new VO();
		vo.setChid(Integer.parseInt(request.getParameter("chid")));
		vo.setQuestion(request.getParameter("question"));
		vo.setS1(request.getParameter("s1"));
		vo.setS2(request.getParameter("s2"));
		vo.setS3(request.getParameter("s3"));
		vo.setS4(request.getParameter("s4"));
		vo.setS5(request.getParameter("s5"));
		vo.setAnswer(request.getParameter("answer"));
	
		new DAO().problem_insert(vo);
		data.setRedirect(true);
		data.setPath("QuizMain");
		
		return data;
	}

}
