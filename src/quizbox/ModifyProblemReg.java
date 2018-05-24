package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class ModifyProblemReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		Integer chid = Integer.parseInt((String)request.getSession().getAttribute("num"));
		System.out.println(chid);
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		DAO dao = new DAO();

		int page = 1;
		int limit = 4, pageLimit = 1;
		
		if(request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int start = (page -1) * limit + 1;
		int end = page*limit;
		System.out.println(end - start);
		
		int startPage = (page-1)/pageLimit*pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		int total = dao.totalCount(chid);
		
		int totalPage = total/limit;
		
		if(total%limit!=0)
			totalPage++;
		
		if(endPage>totalPage)
			endPage = totalPage;
		
		VO vo = new VO();
		vo.setChid(chid);
		vo.setId(id);
		vo.setQuestion(request.getParameter("question"));
		vo.setS1(request.getParameter("s1"));
		vo.setS2(request.getParameter("s2"));
		vo.setS3(request.getParameter("s3"));
		vo.setS4(request.getParameter("s4"));
		vo.setS5(request.getParameter("s5"));
		vo.setAnswer(request.getParameter("answer"));
	
		dao.modify_insert(vo);
//		data.setRedirect(true);
//		data.setPath("QuizMain");
		
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("problem", dao.question(chid, start, end));
		request.setAttribute("menu", "quizmenu.jsp");
		request.setAttribute("main1", "quizbox/problem.jsp");
		request.setAttribute("main2", "quizbox/quizresult.jsp");
		
		return data;
	}

}
