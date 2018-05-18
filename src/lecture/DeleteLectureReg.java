package lecture;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class DeleteLectureReg implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		String delSubject = request.getParameter("subject");
		
	
		DAO dao = new DAO();
		dao.deleteSubject(delSubject);
		ArrayList<String> subjects = dao.getSubjects();
		
		dao.close();
	
		
		System.out.println("이게 지금 되는겁니까? ");
		request.setAttribute("msg", "과목이 삭제됐습니다.");
		request.setAttribute("url", "List="+subjects.get(0));
		request.setAttribute("main", "lecture/alert.jsp");
		return new ActionData();
	}
}
