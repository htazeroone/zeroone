package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class ModifyProblemForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		DAO dao = new DAO();
		Integer chid = Integer.parseInt((String)request.getSession().getAttribute("num"));
		Integer id = Integer.parseInt(request.getParameter("id"));
		
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
		
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("problem", dao.modify_question(chid, id));
		request.setAttribute("menu", "quizmenu.jsp");
		request.setAttribute("main1", "quizbox/ModifyProblemForm.jsp");
		request.setAttribute("main2", "quizbox/quizresult.jsp");
		
		dao.close();
		return data;	
	}

}
