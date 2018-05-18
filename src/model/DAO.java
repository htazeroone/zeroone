package model;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public DAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/oracleDB");
			con = ds.getConnection();

			System.out.println(con);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	public ArrayList<String> getSubjects() {
		
		ArrayList<String> arr = new ArrayList<>();
		try {
			sql = "select distinct subject, suborder from subjectboard order by suborder";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				arr.add(rs.getString("SUBJECT"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	// id로 page를 잡아내기 위한 메소드
	public int getRnum_Lecture(String subject, int id, int head) {
		int rnum = 0;
		try {

			if(head != 0) {

				sql = "select * from "
						+ "(select rownum rnum, tt.* from "
						+ "(select * from lecture where head = ? and subject = ? order by id desc) tt) "
						+ "where id = ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, head);
				ptmt.setString(2, subject);
				ptmt.setInt(3, id);

			} else { // 0인 경우에는?? 즉 전체
				sql = "select * from "
						+ "(select rownum rnum, tt.* from "
						+ "(select * from lecture where subject=? order by id desc) tt) "
						+ "where id = ?";

				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, subject);
				ptmt.setInt(2, id);
			}

			rs = ptmt.executeQuery();
			rs.next();
			rnum = rs.getInt("RNUM");

		} catch(Exception e) {
			e.printStackTrace();
		}
		return rnum;
	}

	// list에서 총 페이지 수를 구하기 위해 필요한 totalCnt 메소드
	public int totalCnt_Lecture(String subject, int head) {

		try {
			// 말머리에서 1~10 중 하나를 선택했을 경우?
			if(head != 0) {
				sql = "select count(*) from lecture where head = ? and subject=?";
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, head);
				ptmt.setString(2, subject);
			} else { // 말머리에서 전체를 선택했을 경우? head == 0
				sql = "select count(*) from lecture where subject=?";
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, subject);
			}

			rs = ptmt.executeQuery();
			rs.next();
			return rs.getInt(1);

		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// list를 빼내오기 위한 메소드
	public ArrayList<VO> list_Lecture(String subject, int start, int end, int head) {

		ArrayList<VO> arr = new ArrayList<>();

		try {
			// head의 도메인은  1~10. 각 숫자는 챕터를 나타냄
			if(head != 0) {
				sql = "select * from "
						+ "(select rownum rnum, tt.* from "
						+ "(select * from lecture where subject=? and head = ? order by id desc) tt) "
						+ "where rnum >= ? and rnum <= ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, subject);
				ptmt.setInt(2, head);
				ptmt.setInt(3, start);
				ptmt.setInt(4, end);

			} else {// head가 0일 때는 chapter 해당사항이 없는 경우, 즉 맨 처음 접속했을 때
				sql = "select * from "
						+ "(select rownum rnum, tt.* from "
						+ "(select * from lecture where subject=? order by id desc) tt) "
						+ "where rnum >= ? and rnum <= ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, subject);
				ptmt.setInt(2, start);
				ptmt.setInt(3, end);
			}

			rs = ptmt.executeQuery();

			while(rs.next()) {
				VO vo = new VO();

				vo.setId(rs.getInt("ID"));
				vo.setCnt(rs.getInt("CNT"));
				vo.setReg_date(rs.getTimestamp("REG_DATE"));

				vo.setPname(rs.getString("PNAME"));
				vo.setHead(rs.getInt("HEAD"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setTitle(rs.getString("TITLE"));

				arr.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

	public ArrayList<String> getChapterList(String subject) {
		
		ArrayList<String> arr = new ArrayList<>();
		try {
			
			sql = "select chaptername from subjectboard where subject = ? order by head";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, subject);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				String chapterName = rs.getString("chaptername");
				arr.add(chapterName);
			}
		} catch(Exception e) {
			
		}
		return arr;
	}
	
	public String getChapterName(int id) {
		
		try {
			
			sql = "select chaptername from subjectboard "
					+ "where subject = (select subject from lecture where id = ?) "
					+ "and head = (select head from lecture where id = ?)";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.setInt(2, id);
			rs = ptmt.executeQuery();
			
			rs.next();
			return rs.getString("CHAPTERNAME");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	// DB에 글 삽입(sequence 대신 max(id) 활용)
	public int insert_Lecture(VO vo, String subject) {
		int nextId = 0;

		try {
			sql = "select max(id)+1 from lecture";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			rs.next();
			nextId = rs.getInt(1);

			System.out.println("nextId: "+nextId);

			sql = "insert into lecture(id, cnt, reg_date, head, pname, title, content, subject) "
					+ "values(?, ?, sysdate, ?, ?, ?, ?, ?)";

			ptmt = con.prepareStatement(sql);

			ptmt.setInt(1, nextId);
			ptmt.setInt(2, -1);

			ptmt.setInt(3, vo.getHead());
			ptmt.setString(4, vo.getPname());
			ptmt.setString(5, vo.getTitle());
			ptmt.setString(6, vo.getContent());
			ptmt.setString(7, subject);
			ptmt.executeUpdate();


		} catch(Exception e) {
			e.printStackTrace();
		}
		return nextId;
	}

	//detail 볼 때  cnt 더해짐.
	public void addCnt_Lecture(int id) {
		try {
			sql = "update lecture set cnt=cnt+1 where id=?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	//detail을 얻어오는 메소드
	public VO detail_Lecture(int id) {
		
		try {		
			
			sql = "select * from lecture where id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1,id);
			rs = ptmt.executeQuery();

			if(rs.next()) {
				VO vo = new VO();
				vo.setId(rs.getInt("ID"));
				vo.setCnt(rs.getInt("CNT"));
				vo.setReg_date(rs.getTimestamp("REG_DATE"));
				vo.setHead(rs.getInt("HEAD"));
				vo.setPname(rs.getString("PNAME"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setContent(rs.getString("CONTENT"));

				return vo;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 글을 '삭제'하거나 '수정'할 때 해당 아이디와 관련된 글이 있는지 확인함
	// 관리자의 경우 pw 확인은 필요없음.
	public boolean search_Lecture(VO vo) {
		boolean chk = false;
		
		try {
			sql = "select * from lecture where id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, vo.getId());
			rs = ptmt.executeQuery();

			chk = rs.next();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return chk;
	}

	// lecture 테이블에서 글 삭제
	public void delete_Lecture(int id) {

		try {

			sql = "delete from lecture where id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	// lecture게시판에서 글 수정
	public void modify_Lecture(VO vo, String subject) {

		try {

			sql = "update lecture set head=?, pname=?, title=?, content=?, subject=? where id=?";

			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, vo.getHead());
			ptmt.setString(2, vo.getPname());
			ptmt.setString(3, vo.getTitle());
			ptmt.setString(4, vo.getContent());
			ptmt.setString(5, subject);
			ptmt.setInt(6, vo.getId());

			ptmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void addNewLecture(String boardName, ArrayList<String> chapNum) {
 		int nextSubOrder = 0;
		try {
			
			sql ="select max(rownum)+1 from (select distinct subject from subjectboard)";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			rs.next();
			nextSubOrder = rs.getInt(1);
			
			
			for(int i = 0; i < chapNum.size(); i++) {
				sql = "insert into subjectboard(subject, head, chaptername, suborder) "
						+ "values(?, ?, ?, ?)";
				
				ptmt = con.prepareStatement(sql);
				
				ptmt.setString(1, boardName);
				ptmt.setInt(2, i);
				ptmt.setString(3, chapNum.get(i));
				ptmt.setInt(4, nextSubOrder);
				
				ptmt.executeUpdate();
			}
				
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteSubject(String delSubject) {
		
		try {
			
			sql = "delete from subjectBoard where subject=?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, delSubject);
			ptmt.executeUpdate();
			
			sql = "delete from lecture where subject=?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, delSubject);
			ptmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	//지아 - 로그인 성공시 pname, pid 담은 VO 리턴
	public VO loginReg(VO vo) {

		sql = "select pname from member where pid=? and pw=?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, vo.getPid());
			ptmt.setString(2, vo.getPw());
			rs = ptmt.executeQuery();

			if(rs.next()) {
				VO res = new VO();
				res.setId(vo.getId());
				res.setPname(rs.getString("pname"));
				System.out.println("loginReg() 성공");
				return res;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	//지아 -회원가입 시 동일 id 존재 여부 확인 (중복이라면 false 리턴)
	public boolean pidChk(String pid) {
		sql = "select * from member where pid = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, pid);
			rs = ptmt.executeQuery();

			if(rs.isBeforeFirst()) {
				System.out.println("id가 중복된닷");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;

	}

	//지아 -회원가입 시 동일 pname 존재 여부 확인 (중복이라면 false 리턴)
			public boolean pnameChk(String pname) {
				sql = "select * from member where pname = ?";
				try {
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, pname);
					rs = ptmt.executeQuery();

					if(rs.isBeforeFirst()) {
						System.out.println("pname이 중복된닷");
						return false;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return true;

			}
	//지아 -회원가입 시킨다
	public void join(VO vo) {
		sql = "insert into member (pid, pname, pw) values (?, ?, ?)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, vo.getPid());
			ptmt.setString(2, vo.getPname());
			ptmt.setString(3, vo.getPw());
			ptmt.executeUpdate();

			System.out.println("DB에 회원가입완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


	//지아 -비밀번호 변경시 -- 기존비밀번호를 정확히 입력했는지 확인
	public boolean pwChk(VO vo) {
		sql = "select * from member where pid=? and pw=?";
		System.out.println("pwChk() pid:"+vo.getPid());
		System.out.println("pwChk() pw:"+vo.getPw());
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, vo.getPid());
			ptmt.setString(2, vo.getPw());
			rs = ptmt.executeQuery();

			if(rs.next()) {
				System.out.println("기존 비밀번호를 정확히 입력함.");
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	//지아 -비밀번호 변경시 -- 새 비밀번호로 업데이트
	public void pwUpdate(VO vo) {
		sql = "update member set pw = ? where pid=?";
		System.out.println("pwUpdate() pid:"+vo.getPid());
		System.out.println("pwUpdate() pw:"+vo.getPw());
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, vo.getPw());
			ptmt.setString(2, vo.getPid());
			ptmt.executeUpdate();
			System.out.println("비밀번호 갱신완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//지아 -회원 탈퇴
	public void deleteMember(VO vo) {
		sql = "delete member where pw=? and pid=?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, vo.getPw());
			ptmt.setString(2, vo.getPid());
			ptmt.executeUpdate();
			System.out.println("deleteMember() 회원 탈퇴 완료");
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}


	//지아 -학습성취도 -- 전체 챕터 수  (quiz테이블 참조)
	public int totalChNum() {
		sql = "select count(distinct chid) count from quiz where chid is not null";
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				System.out.println("전체 챕터 수:"+rs.getInt(1));
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("totalChNum() 종료");
		return 0;
	}

	//지아 -학습성취도 -- 전체 챕터 이름 ArrayList
	public ArrayList<String> totalChName(){
		ArrayList<String> res = new ArrayList();
		sql = "select chname from chname";

		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			while(rs.next()) {
				res.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("totalChName() 종료");
		return res;
	}


	//지아 -학습성취도 -- 각 챕터 안의 문제 수
	public ArrayList<Double> eachQNum() {
		ArrayList<Double> res = new ArrayList();
		sql = "select count(distinct id) count from quiz group by chid order by chid";
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				System.out.println("각 챕터 안의 문제 수:"+rs.getInt(1));
				res.add(rs.getDouble(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("eachQNum() 종료");
		return res;
	}

	//지아 -학습성취도 -- 지금pid의 chid마다의 ox==1인 문제 개수
	public ArrayList<VO> eachOXNum(String pid) {
		ArrayList<VO> res = new ArrayList<VO>();
		//sql = "select count(ox) ox from study_note where pid = ? and ox='1' group by chid";
		sql = "select chid, count(ox) ox from study_note where pid = ? and ox='1' group by chid order by chid";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, pid);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				VO vo = new VO();
				vo.setChid(rs.getInt("chid"));
				vo.setOx(rs.getInt("ox"));
				res.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("eachOXNum() 종료");
		return res;
	}
	
	
	//지아 -학습노트 진입 -- 사용자의 study_note에 데이터가 있는지 없는지 구분 
	public boolean isDataInNote(String pid) {
		sql = "select * from study_note where pid = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, pid);
			rs = ptmt.executeQuery();
			System.out.println("pid:"+pid);
			
			if(rs.next()) {
				System.out.println("study_note에 데이터가 있네요");
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	

	//지아 -학습노트 왼쪽 메뉴 -- 사용자가 학습노트에 저장해둔 챕터 번호와 챕터명을 리턴
	public ArrayList<VO> getChidList(String pid){
		ArrayList<VO> chList = new ArrayList();
		
		sql = "select * from chname where chid in (select distinct chid from study_note where pid = ?)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, pid);
			rs = ptmt.executeQuery();
			System.out.println("pid:"+pid);
			while(rs.next()) {
				VO vo = new VO();
				vo.setChid(rs.getInt("chid"));
				vo.setChname(rs.getString("chname"));
				chList.add(vo);
			}
			return chList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


//찬 qna랑 notice 리스트 종류랑 스타트와 엔드

	public ArrayList<VO> qnlist(String kind, int start, int end){

		ArrayList<VO> arr = new ArrayList<>();

		try {

			sql = "select * from (select rownum rnum, tt.* from (select * from info where kind = ? order by gid desc, seq) tt)"
					+ " where rnum >= ? and rnum <= ?" ;

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, kind);
			ptmt.setInt(2, start);
			ptmt.setInt(3, end);


			rs = ptmt.executeQuery();

			while(rs.next()) {

				VO vo = new VO();

				vo.setKind(rs.getString("kind"));
				vo.setId(rs.getInt("id"));
				vo.setGid(rs.getInt("gid"));
				vo.setSeq(rs.getInt("seq"));
				vo.setLev(rs.getInt("lev"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setRec(rs.getInt("rec"));
				vo.setReg_date(rs.getDate("reg_date"));
				vo.setPname(rs.getString("pname"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setUpfile(rs.getString("upfile"));

				arr.add(vo);


			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return arr;

	}


	//ㅊ kind별 게시물 토탈 개수

	public int infototal(String kind) {

			try {
				sql = "select count(*) from info where kind = ?";
				ptmt = con.prepareStatement(sql);

				ptmt.setString(1, kind);
				rs = ptmt.executeQuery();

				rs.next();

				return rs.getInt(1);
			} catch (Exception e) {
				// TODO: handle exception
			}

			return 0;
	}

	//ㅊ qna 디테일

	public VO qdetail(int id) {

		VO vo = new VO();

		try {
			sql="select * from info where id = ?";
			ptmt = con.prepareStatement(sql);

			ptmt.setInt(1, id);

			rs = ptmt.executeQuery();

			if(rs.next()) {

				vo.setKind(rs.getString("kind"));
				vo.setId(rs.getInt("id"));
				vo.setGid(rs.getInt("gid"));
				vo.setSeq(rs.getInt("seq"));
				vo.setLev(rs.getInt("lev"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setRec(rs.getInt("rec"));
				vo.setReg_date(rs.getDate("reg_date"));
				vo.setPname(rs.getString("pname"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setUpfile(rs.getString("upfile"));

				return vo;

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}

//ㅊ qna 인설트
	public int qinsert(VO vo) {

		int nextid = 0;

		try {
			sql="select max(id)+1 from info";
			ptmt=con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			rs.next();

			nextid=rs.getInt(1);

			sql="insert into info(kind,id,gid,seq,lev,cnt,rec,reg_date,pname,title,content,upfile) "
					+ "values(?,?,?,0,0,-1,0,sysdate,?,?,?,?)" ;

			ptmt=con.prepareStatement(sql);

			ptmt.setString(1, vo.getKind());
			ptmt.setInt(2, nextid);
			ptmt.setInt(3, nextid);
			ptmt.setString(4, vo.getPname());
			ptmt.setString(5, vo.getTitle());
			ptmt.setString(6, vo.getContent());
			ptmt.setString(7, vo.getUpfile());

			ptmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return nextid;
	}

	//ㅊ 수정
		public void modify(VO vo) {

			try {
				sql="update info set pname = ?,upfile = ? , title = ? , content = ? where id=?";
				ptmt=con.prepareStatement(sql);

				ptmt.setString(1, vo.getPname());
				ptmt.setString(2, vo.getUpfile());
				ptmt.setString(3, vo.getTitle());
				ptmt.setString(4, vo.getContent());
				ptmt.setInt(5, vo.getId());

				ptmt.executeUpdate();

			} catch (Exception e) {
				// TODO: handle exception
			}

		}

	//ㅊ 삭제

		public void qdelete(int id) {

			System.out.println("qdelete 메소드");

			try {
				sql="select upfile,kind from info where id = ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, id);

				rs = ptmt.executeQuery();
				rs.next();

				String file = rs.getString(1);
				String kind = rs.getString(2);

				String path = "F:\\chan\\semi\\SemiQuiz\\WebContent\\up\\"+kind+"\\"+file;

				sql="delete from info where id = ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, id);

				ptmt.executeUpdate();


				File ff = new File(path);
				ff.delete();

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}

		}

		//승진 quiz 문제 출력
		
		public ArrayList<VO> question(int chid) {
			ArrayList<VO> res = new ArrayList<>();

			try {
				sql="select * from quiz where chid = ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, chid);
				rs = ptmt.executeQuery();

				while(rs.next()) {
					VO vo = new VO();
					vo.setQuestion(rs.getString("question"));
					vo.setId(rs.getInt("id"));
					vo.setChid(rs.getInt("chid"));
					vo.setAnswer(rs.getString("answer"));
					vo.setS1(rs.getString("s1"));
					vo.setS2(rs.getString("s2"));
					vo.setS3(rs.getString("s3"));
					vo.setS4(rs.getString("s4"));
					vo.setS5(rs.getString("s5"));
					res.add(vo);
				}


			} catch (Exception e) {
				// TODO: handle exception
			}
			return res;
		}
		
		//승진 문제 푼 결과 저장 
		public int insertresult(VO vo) {
			try {
				sql = "insert into study_note"
						+"(chid, id, input, ox) values (?, ?, ?, ?)";			
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, vo.getChid());
				ptmt.setInt(2, vo.getId());							
				ptmt.setString(3, vo.getInput());
				ptmt.setInt(4, vo.getOx());
				ptmt.executeUpdate();

			} catch(SQLException e) {
				
			}
			return 0;
		}
		
		//승진 문제 푼 결과 출력

		public ArrayList<VO> result(int chid) {
			ArrayList<VO> res = new ArrayList<>();

			try {
				sql="select * from study_note where chid = ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, chid);
				rs = ptmt.executeQuery();

				while(rs.next()) {
					VO vo = new VO();
					vo.setOx(rs.getInt("ox"));
					vo.setChid(rs.getInt("chid"));
					vo.setInput(rs.getString("input"));
					res.add(vo);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return res;
		}
		
		//ㅊ 답글 입력
		public int cominsert(VO vo) {
			
			int nextid=0;
			
			try {
				
				sql="select max(id)+1 from info";
				ptmt=con.prepareStatement(sql);
				rs = ptmt.executeQuery();

				rs.next();

				nextid=rs.getInt(1);
				
				VO ori = qdetail(vo.id);
				
				sql = "update info set seq=seq+1 where gid=? and seq > ?";
				
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, ori.getGid());
				ptmt.setInt(2, ori.getSeq());
				ptmt.executeUpdate();
				
				sql="insert into info(kind,id,gid,seq,lev,cnt,rec,reg_date,pname,title,content) "
						+ "values(?,?,?,?,?,-1,0,sysdate,?,?,?)";
				
				ptmt = con.prepareStatement(sql);
				
				ptmt.setString(1,ori.getKind());
				ptmt.setInt(2, nextid);
				ptmt.setInt(3, ori.getGid());
				ptmt.setInt(4, ori.getSeq()+1);
				ptmt.setInt(5, ori.getLev()+1);
				ptmt.setString(6, vo.getPname());
				ptmt.setString(7, vo.getTitle());
				ptmt.setString(8, vo.getContent());
				
				ptmt.executeUpdate();
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return nextid;
		}
		
		//ㅊ 댓글 삽입
		public void replyinsert(VO vo) {
			
			try {
				int nextid=0;
				sql="select max(id) from reply";
				ptmt=con.prepareStatement(sql);
				rs = ptmt.executeQuery();
				
				rs.next();
				
				nextid=rs.getInt(1)+1;

				sql = "insert into reply(orid,id,gid,seq,lev,pname,content,reg_date)"
						+ "values(?,?,?,0,0,?,?,sysdate)";
				
				ptmt=con.prepareStatement(sql);
				ptmt.setInt(1, vo.getId());
				ptmt.setInt(2, nextid);
				ptmt.setInt(3, nextid);
				ptmt.setString(4, vo.getPname());
				ptmt.setString(5, vo.getContent());
				
				ptmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		//ㅊ 댓글 리스트
		public ArrayList<VO> replylist(int id){
			ArrayList<VO> arr = new ArrayList<>();
			
			try {
				sql = "select * from reply where orid = ?";
				ptmt=con.prepareStatement(sql);
				ptmt.setInt(1, id);
				
				rs=ptmt.executeQuery();
				
				while(rs.next()) {
					
					VO vo = new VO();
					vo.setOrid(rs.getInt("orid"));
					vo.setId(rs.getInt("id"));
					vo.setGid(rs.getInt("gid"));
					vo.setSeq(rs.getInt("seq"));
					vo.setLev(rs.getInt("lev"));
					vo.setPname(rs.getString("pname"));
					vo.setContent(rs.getString("content"));
					vo.setReg_date(rs.getDate("reg_date"));
					
					arr.add(vo);
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			return arr;
		}

		//ㅊ 추천수
		public void qnrec(int id) {
			
			try {
				sql="update info set rec=rec+1 where id = ?";
				ptmt=con.prepareStatement(sql);
				ptmt.setInt(1, id);
				
				ptmt.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
			}
	
		}
		
		//ㅊ 조회수
		public void qncnt(int id) {
			
			try {
				sql="update info set cnt=cnt+1 where id = ?";
				ptmt=con.prepareStatement(sql);
				ptmt.setInt(1, id);
				
				ptmt.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
			}
	
		}
		
		//ㅊ 댓글삭제
		
		public void recdelete(int id) {
			
			try {
				sql="delete from reply where id = ?";
				ptmt=con.prepareStatement(sql);
				ptmt.setInt(1, id);
				
				ptmt.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	public void close() {
		if(rs!= null) try {rs.close();} catch(Exception e) {e.printStackTrace();}
		if(ptmt!= null) try {ptmt.close();} catch(Exception e) {e.printStackTrace();}
		if(con!= null) try {con.close();} catch(Exception e) {e.printStackTrace();}
	}
}