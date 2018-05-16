package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class List implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		int page=1, limit = 7, pageLimit = 3;
		
		DAO dao = new DAO();
		
		// 여기서 말거리 기능 생각해보기!
		
		int head = 0;
		
		if(request.getParameter("head") != null && !request.getParameter("head").equals("")) {
			head = Integer.parseInt(request.getParameter("head"));
		}
		
		if(request.getParameter("id") != null && !request.getParameter("id").equals("")) {
			int rnum = dao.getRnum_Lecture(Integer.parseInt(request.getParameter("id")));
			page = rnum / limit;
			
			if(rnum % limit != 0) {
				page++;
			}
		}
		
		if(request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int start = (page-1) * limit + 1;
		int end = page * limit;
		
		int startPage = (page-1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		int total = dao.totalCnt_Lecture();
		int totalPage = total/limit;
		
		if( total % limit != 0) {
			totalPage++;
		}
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		System.out.println(head);
		request.setAttribute("head", head);
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("data", dao.list_Lecture(start, end, head));
		System.out.println("????????/");
		dao.close();
		
		
		request.setAttribute("main", "lecture/list.jsp");
		return new ActionData();
	}
}
