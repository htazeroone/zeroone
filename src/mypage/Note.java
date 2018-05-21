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

		//사용자가 입력한답 뭉탱이
		ArrayList<String> input = new ArrayList<String>();
		
		//문제 번호와 사용자 입력값만 가진 리스트 
		ArrayList<VO> idAndInput = new ArrayList<VO>();
		
		//정답 확인 결과 
		ArrayList<VO> res = null;
		//학습노트에서 삭제하고 싶은 문제 번호 뭉탱이 
		ArrayList<Integer> deleteId = new ArrayList<Integer>();
		//삭제할 문제 개수
		int deleteIdSize = 0;
		
		
		//사용자의 study_note에 데이터가 있나 없나  구분 
		if(dao.isDataInNote(pid)) { //--학습노트에 데이터가 있다면
			//pid의 study_note에 있는 chid 들을 가져와 메뉴를 뿌려준다
			chList = dao.getChidList(pid);		
			
			//메뉴에서 챕터를 클릭하지 않았다면, 
			if(null==request.getParameter("chid")) {
				System.out.println("가장 최신 챕터id: "+chList.get(0).getChid());				
				//chid: 현재 챕터 번호를 가장 최신 챕터번호로 지정 
				chid = chList.get(0).getChid();
				
			}else { //메뉴에서 챕터를 클릭했다면(또는 현재 챕터 값이 지정되어 있다면), 챕터의 문제들을 읽어온다 
				//chid: 클릭한 챕터번호를 저장 
				chid = Integer.parseInt(request.getParameter("chid"));
				System.out.println("사용자가 클릭한 챕터번호:"+chid);
			}
			System.out.println("chid:"+chid);
			//qNum: 챕터의 문제 수
			qNum = dao.qNum(chid, pid);
			System.out.println("qNum:"+qNum);
			//qInfo: 챕터의 문제 데이터 모두
			qInfo = dao.qInfo(chid, pid);
			
			//사용자가 정답을 찍어서 보낸경우, (파라미터 이름은 문제 번호, 값은 선택지번호)
			if(null!=request.getParameter(Integer.toString(qInfo.get(0).getId()))){		
				for(int i=0; i<qNum; i++) {
					input.add(request.getParameter(Integer.toString(qInfo.get(i).getId())));
					System.out.println("input답:"+input.get(i));
				}
				
				//idList : 답을 확인 할 '문제번호 리스트'를 생성
				ArrayList<Integer> idList = new ArrayList();
				for(int i=0; i<qNum; i++) {
					idList.add(qInfo.get(i).getId());
					System.out.println("답 맞춰볼 문제번호 리스트:"+idList.get(i));
				}
				
				//quizRes : 문제 번호와 사용자 입력 답을 입력하여 정오답 결과 및 정답 리턴
				//res : id, ox, answer, input 을 가지고있다 
				res = dao.quizRes(pid, chid, idList, input, qNum);			
				System.out.println(res);
				
				//idAndInput : 문제 번호, 보기, 사용자 입력값만 가진 리스트 
				for(int i=0; i<qNum; i++) {
					VO inputVo = new VO();
					inputVo.setQuestion(qInfo.get(i).getQuestion());
					inputVo.setCorrection(qInfo.get(i).getCorrection());
					inputVo.setTotal(qInfo.get(i).getTotal());
					inputVo.setId(qInfo.get(i).getId());
					inputVo.setInput(input.get(i));
					inputVo.setS1(qInfo.get(i).getS1());
					inputVo.setS2(qInfo.get(i).getS2());
					inputVo.setS3(qInfo.get(i).getS3());
					inputVo.setS4(qInfo.get(i).getS4());
					inputVo.setS5(qInfo.get(i).getS5());
					idAndInput.add(inputVo);
				}
				//사용자가 찍은 정답들이 그대로 보이게 다시 보내준다 
				request.setAttribute("idAndInput", idAndInput);
			}
			
			//학습노트에서 삭제할 문제id 들을 보낸경우, 
			if(null!=request.getParameterValues("deleteId")) {
							
				String [] deleteInput = request.getParameterValues("deleteId");
				
				//체크된 ID만 추려냄
				for(int i=0; i<deleteInput.length; i++) {
					System.out.println("삭제하고 싶은 문제 id:"+deleteInput[i]);
					deleteId.add(Integer.parseInt(deleteInput[i]));	
				}
				deleteIdSize = deleteId.size();
				//DB에서 deleteId 들만 study_note에서 삭제 
				dao.deleteId(pid, chid, deleteId, deleteIdSize);
				
				
				//qInfo: 챕터의 문제 데이터 모두 다시 가져온다 
				qInfo = dao.qInfo(chid, pid);
			}
			
			request.setAttribute("res", res);
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
