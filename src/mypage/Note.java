package mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Note implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		String pid = (String)request.getParameter("pid");
		System.out.println("pid:"+pid);

		DAO dao = new DAO();
		VO vo = new VO();
		ArrayList<VO> chList = null;
		int chid = 0;

		
		//사용자의 study_note에 데이터가 있나 없나  구분 
		if(dao.isDataInNote(pid)) { //--학습노트에 데이터가 있다면
			//pid의 study_note에 있는 chid 들을 가져와 메뉴를 뿌려준다
			System.out.println("dao.getChidList(pid) 수행");
			chList = dao.getChidList(pid);
		
			//메뉴에서 챕터를 클릭하지 않았다면, 
			if(null==request.getParameter("chid")) {
				//가장 최신 chList의 문제들을 가져온다 
				System.out.println(chList.get(0).getChid());
			}else { //메뉴에서 챕터를 클릭했다면,
				chid = Integer.parseInt(request.getParameter("chid"));
				System.out.println("chid:"+chid);
			}
			
			request.setAttribute("menu", "studymenu.jsp");
			request.setAttribute("main1", "mypage/studypage.jsp");
			
		}else { //--학습노트에 데이터가 없다면
			System.out.println("note에 데이터가 없어서 빈 화면 출력");
			request.setAttribute("main", "mypage/studypage_empty.jsp");
		}

		request.setAttribute("chList", chList);
		request.setAttribute("studytest", "studytest");

	/*	request.setAttribute("main2", "mypage/answerpage.jsp");*/

		return new ActionData();
	}

}
