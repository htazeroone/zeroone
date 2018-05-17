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

//==============================================================
		//전체 챕터 수
		int totalChNum = dao.totalChNum();
		request.setAttribute("totalChNum", totalChNum);

		//전체 챕터 이름 ArrayList
		ArrayList<String> chName = dao.totalChName();
		System.out.println("전체 챕터 이름 출력");
		for(String s : chName) {
			//System.out.println(s);
		}
		request.setAttribute("chName", chName);


		//모든 챕터 안의 문제 수
		ArrayList<Double> eachQNum = dao.eachQNum();
		request.setAttribute("eachQNum", eachQNum);
		System.out.println("각 챕터 안의 문제 수 출력");
		for(Double s : eachQNum) {
			System.out.println(s);
		}

		//eachOXNum : 지금pid의 chid마다의 ox==1인 문제 개수
		//ArrayList<Double> eachOXNum = dao.eachOXNum(pid);
		ArrayList<VO> eachOXNum = dao.eachOXNum(pid);

		ArrayList<Integer> resultONum = new ArrayList();
		request.setAttribute("eachOXNum", eachOXNum);
		System.out.println("지금pid의 chid마다의 ox==1인 문제 개수");

		System.out.println("eachOXNum.size():"+eachOXNum.size());

		//totalChNum : 전체 챕터 수
		int nono=0;
		for(int total=1; total<=totalChNum; total++)
		{
			for(int chSeq=0; chSeq<eachOXNum.size(); chSeq++) {
				int temp = eachOXNum.get(chSeq).getChid();
				//System.out.println("찾을 챕터"+eachOXNum.get(chSeq).getChid());
				System.out.println("total:"+total);
				System.out.println("temp:"+temp);

				if(temp==total) {
					//resultONum.add(0);
					System.out.println("찾았다! total:"+total+" temp:"+temp);
					resultONum.add(eachOXNum.get(chSeq).getOx());
					break;
				}else {
					System.out.println("아니얌");
					System.out.println("nono: "+nono);
					nono++;
					if(eachOXNum.size()==nono) {
						System.out.println("nono:"+nono);
						resultONum.add(0);
					}
				}
			}
			nono=0;
		}

		for(int ii : resultONum) {
			System.out.println("ch마다의 맞은 개수  resultONum:"+ii);
		}

		ArrayList<Integer> percent = new ArrayList<Integer>();

		//ArrayList<Integer> percent = new ArrayList<Integer>();


		System.out.println("each:"+eachQNum);
		for(int i=0; i<totalChNum; i++) {
			System.out.println("resultONum.get(i) "+resultONum.get(i));
			System.out.println("eachQNum.get(i) "+eachQNum.get(i));
			//System.out.println("hear:"+eachOXNum.get(i)/eachQNum.get(i)*100);

			percent.add((int)(resultONum.get(i)/eachQNum.get(i)*100));
			//System.out.println("hi:"+eachQNum.get(i));
		}
		request.setAttribute("percent", percent);

		System.out.println("percent출력");
		for(int s : percent) {
			System.out.println(s);
		}

		dao.close();

		request.setAttribute("main", "mypage/achieve.jsp");
		return new ActionData();
	}

}
