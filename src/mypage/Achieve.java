package mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Achieve implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {

		String pid = (String)request.getParameter("pid");
		System.out.println("Achieve 진입 성공! pid:"+pid);
		DAO dao = new DAO();
		VO vo = new VO();

/*
 		전체 챕터 수 (quiz테이블 참조)
select count(distinct chid) count from quiz where chid is not null;

 		전체 챕터 이름 ArrayList (chname테이블 참조)
select chname from chname;

		각 챕터 안의 문제 수 (quiz테이블 참조)(ArrayList로 담아오기)
select chid, count(distinct id) count from quiz group by chid;
select count(distinct id) count from quiz group by chid;

		지금pid의 chid마다의 ox==1인 문제 개수들  (study_note 테이블 참조)(ArrayList로 담아오기)
select chid, count(ox) ox from study_note where pid = 'jia' and ox='1' group by chid;
select count(ox) ox from study_note where pid = 'jia' and ox='1' group by chid;

		for 문으로 처리
		퍼센트 = ox문제수 / 챕터안의 문제 수  */

		//전체 챕터 수
		int totalChNum = dao.totalChNum();

		//전체 챕터 이름 ArrayList
		ArrayList<String> chName = dao.totalChName();
		System.out.println("전체 챕터 이름 출력");
		for(String s : chName) {
			System.out.println(s);
		}

		//각 챕터 안의 문제 수
		ArrayList<Double> eachQNum = dao.eachQNum();
		System.out.println("각 챕터 안의 문제 수 출력");
		for(Double s : eachQNum) {
			System.out.println(s);
		}

		//지금pid의 chid마다의 ox==1인 문제 개수
		ArrayList<Double> eachOXNum = dao.eachOXNum(pid);
		System.out.println("지금pid의 chid마다의 ox==1인 문제 개수");
		for(Double s : eachOXNum) {
			System.out.println(s);
		}

		ArrayList<Integer> percent = new ArrayList();
		for(int i=0; i<eachQNum.size(); i++) {
			percent.add((int)(eachOXNum.get(i)/eachQNum.get(i)*100));
		}

		System.out.println("percent출력");
		for(int s : percent) {
			System.out.println(s);
		}

		dao.close();

		request.setAttribute("totalChNum", totalChNum);
		request.setAttribute("chName", chName);
		request.setAttribute("eachQNum", eachQNum);
		request.setAttribute("eachOXNum", eachOXNum);
		request.setAttribute("percent", percent);
		request.setAttribute("main", "mypage/achieve.jsp");
		return new ActionData();
	}

}
