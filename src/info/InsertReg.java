package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class InsertReg implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		VO vo = new VO();
		
		System.out.println("adsfsadf : "+request.getParameter("kind"));
		
		vo.setKind(request.getParameter("kind"));
		vo.setPname(request.getParameter("pname"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setUpfile(request.getParameter("upfile"));
		
		
		data.setPath("Detail?id="+dao.qinsert(vo));
		data.setRedirect(true);

		dao.close();
		
		return data;
	}
}
