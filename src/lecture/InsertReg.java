package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class InsertReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		VO vo = new VO();
		vo.setPname(request.getParameter("pname"));
		vo.setTitle(request.getParameter("title"));
		vo.setHead(Integer.parseInt(request.getParameter("head")));
		vo.setContent(request.getParameter("content"));
		
		DAO dao = new DAO();
		int id = dao.insert_Lecture(vo);
		dao.close();
		ActionData data = new ActionData();
		data.setRedirect(true);
		data.setPath("Detail?id="+id);
		
		return data;
	}
}
