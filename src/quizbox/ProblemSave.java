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

		if(request.getParameter("save1") != null && !request.getParameter("save1").equals("")||
			request.getParameter("save2") != null && !request.getParameter("save2").equals("")||
			request.getParameter("save3") != null && !request.getParameter("save3").equals("")||
			request.getParameter("save4") != null && !request.getParameter("save4").equals("")) {

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
		}else if(request.getParameter("save5") != null && !request.getParameter("save5").equals("")||
				request.getParameter("save6") != null && !request.getParameter("save6").equals("")||
				request.getParameter("save7") != null && !request.getParameter("save7").equals("")||
				request.getParameter("save8") != null && !request.getParameter("save8").equals("")) {

				for(int i=5; i<=8; i++) {

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
			}else if(request.getParameter("save9") != null && !request.getParameter("save9").equals("")||
			request.getParameter("save10") != null && !request.getParameter("save10").equals("")||
			request.getParameter("save11") != null && !request.getParameter("save11").equals("")||
			request.getParameter("save12") != null && !request.getParameter("save12").equals("")) {

			for(int i=9; i<=12; i++) {

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
		}
		


		request.setAttribute("problem", dao.question(chid, start, end));
		request.setAttribute("result", dao.result(pid,chid, start, end));
		request.setAttribute("menu", "quizmenu.jsp");
		request.setAttribute("main1", "quizbox/problem.jsp");
		request.setAttribute("main2", "quizbox/answer.jsp");
		
		dao.close();
		
		return data;
	}

}
