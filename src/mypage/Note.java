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
		//qNum : 사용자가 선택한 챕터의 문제개수 
		int qNum = 0;
		//읽어올 문제 데이터들
		ArrayList<VO> qInfo = null;
		
		//사용자의 study_note에 데이터가 있나 없나  구분 
		if(dao.isDataInNote(pid)) { //--학습노트에 데이터가 있다면
			//pid의 study_note에 있는 chid 들을 가져와 메뉴를 뿌려준다
			chList = dao.getChidList(pid);
			System.out.println("dao.getChidList(pid) 수행");
			
			
			//메뉴에서 챕터를 클릭하지 않았다면, 
			if(null==request.getParameter("chid")) {
				//가장 최신 챕터의 문제 수 
				System.out.println("가장 최신 챕터id: "+chList.get(0).getChid());
				qNum = dao.qNum(chList.get(0).getChid(), pid);
				
				//가장 최신 챕터의 문제들을 읽어온다
				qInfo = dao.qInfo(chList.get(0).getChid(), pid);
				
			}else { //메뉴에서 챕터를 클릭했다면, 챕터의 문제들을 읽어온다 
				chid = Integer.parseInt(request.getParameter("chid"));
				qNum = dao.qNum(chid, pid);
				System.out.println("사용자가 클릭한 챕터번호:"+chid);
				qInfo = dao.qInfo(chid, pid);
			}
			request.setAttribute("chList", chList);
			request.setAttribute("chid", chid);
			request.setAttribute("qInfo", qInfo);
			request.setAttribute("menu", "studymenu.jsp");
			request.setAttribute("main1", "mypage/studypage.jsp");
			
		}else { //--학습노트에 데이터가 없다면
			System.out.println("note에 데이터가 없어서 빈 화면 출력");
			request.setAttribute("main", "mypage/studypage_empty.jsp");
		}

		dao.close();
		

	/*	request.setAttribute("main2", "mypage/answerpage.jsp");*/

		return new ActionData();
	}

}
