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

	int page = 1;
	int limit = 4, pageLimit = 1;
	
	if(request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
		page = Integer.parseInt(request.getParameter("page"));
	}
	
	int start = (page -1) * limit + 1;
	int end = page*limit;
	
	int startPage = (page-1)/pageLimit*pageLimit + 1;
	int endPage = startPage + pageLimit - 1;
	
	int total = dao.totalCount(chid);
	
	int totalPage = total/limit;
	
	if(total%limit!=0)
		totalPage++;
	
	if(endPage>totalPage)
		endPage = totalPage;

	if(request.getParameter("id1") != null && !request.getParameter("id1").equals("")) {
		System.out.println(request.getParameter("id1"));		

		for(int j=1; j<=4; j++) {
			vo.setId(Integer.parseInt(request.getParameter("id"+j)));
			vo.setInput(request.getParameter("selection"+j));	
			if(request.getParameter("selection"+j).equals(dao.question(chid,start,end).get(j-1).getAnswer())) {
				vo.setOx(1);
			}else {
				vo.setOx(0);
			}

			dao.insert_result(vo);
		}
	} else if(request.getParameter("id5") != null && !request.getParameter("id5").equals("")) {

		for(int j=5; j<=8; j++) {
			vo.setId(Integer.parseInt(request.getParameter("id"+j)));
			vo.setInput(request.getParameter("selection"+j));	
			if(request.getParameter("selection"+j).equals(dao.question(chid,start,end).get(j-5).getAnswer())) {
				vo.setOx(1);
			}else {
				vo.setOx(0);
			}
			dao.insert_result(vo);
		}
	} else if(request.getParameter("id9") != null && !request.getParameter("id9").equals("")) {
		System.out.println(request.getParameter("id9"));		
		for(int j=9; j<=12; j++) {
			vo.setId(Integer.parseInt(request.getParameter("id"+j)));
			vo.setInput(request.getParameter("selection"+j));	
			if(request.getParameter("selection"+j).equals(dao.question(chid,start,end).get(j-9).getAnswer())) {
				vo.setOx(1);
			}else {
				vo.setOx(0);
			}
			dao.insert_result(vo);
		}
	}
	
	request.setAttribute("page", page);
	request.setAttribute("start", start);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	request.setAttribute("totalPage", totalPage);
	request.setAttribute("problem", dao.question(chid, start, end));
	request.setAttribute("result", dao.result(pid, chid, start, end));
	request.setAttribute("menu", "quizmenu.jsp");
	request.setAttribute("main1", "quizbox/problem.jsp");
	request.setAttribute("main2", "quizbox/answer.jsp");
	
	dao.close();
	return data;	
	
	}	

}
