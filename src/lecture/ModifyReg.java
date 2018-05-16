package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class ModifyReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("안 들어와??");
		
		VO vo = new VO();
		
		System.out.println(Integer.parseInt(request.getParameter("id")));
		vo.setId(Integer.parseInt(request.getParameter("id")));
		
		System.out.println("왜 되다가 마는거지?");
		String msg = "수정 실패";
		String url = "ModifyForm?id="+vo.getId();
		
		DAO dao = new DAO();
		if(dao.search_Lecture(vo)) {
			vo.setHead(Integer.parseInt(request.getParameter("head")));
			vo.setPname(request.getParameter("pname"));
			vo.setTitle(request.getParameter("title"));
			vo.setContent(request.getParameter("content"));

			dao.modify_Lecture(vo);
			msg = "수정 성공";
			url = "Detail?id="+vo.getId();
			
		}
		
		dao.close();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "lecture/alert.jsp");
		
		return new ActionData();
	}

}