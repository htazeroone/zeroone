package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Rereinsert implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		ActionData data = new ActionData();
		
		VO vo = new VO();
		
		System.out.println("컨텐트 : " + request.getParameter("rrcontent"));
		
		int orid = Integer.parseInt(request.getParameter("orid"));
		int gid = Integer.parseInt(request.getParameter("gid"));
		int id = Integer.parseInt(request.getParameter("id"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		int lev = Integer.parseInt(request.getParameter("lev"));
		
		vo.setPname(request.getParameter("pname"));
		vo.setContent("└"+request.getParameter("rrcontent"));
		vo.setOrid(orid);
		vo.setId(id);
		vo.setGid(gid);
		vo.setSeq(seq);
		vo.setLev(lev);
		
		DAO dao = new DAO();
		
		dao.rereinsert(vo);
		
		data.setRedirect(true);
		data.setPath("Detail?page="+request.getParameter("page")+"&id="+orid);
		
		dao.close();
		
		return data;
	}
}
