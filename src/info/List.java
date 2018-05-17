package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class List implements Action{
	
	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		
		
		
		String kind = request.getParameter("kind");
		
		int page = 1;
		
		int limit = 3, pagelimit=4;

		
		if(request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
			
			page = Integer.parseInt(request.getParameter("page"));
			
		}
		
		int start = (page-1)*limit+1;
		int end = page*limit;
		
		int startpage = (page-1)/pagelimit*pagelimit+1;
		int endpage = startpage+pagelimit-1;
		
		DAO dao = new DAO();
		
		int total = dao.infototal(kind);
		
		int totalpage = total/limit;
		
		if(total%limit!=0) {
			totalpage++;
		}
		
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		
		request.setAttribute("kind", kind);
		
		request.setAttribute("data", dao.qnlist(kind, start, end));
		
		request.setAttribute("main", "info/qnalist.jsp");
		
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("totalpage", totalpage);
		
		dao.close();
		
		return data;
	}

}
