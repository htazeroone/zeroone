package model;

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

	public int getRnum(int id) {
		int rnum = 0;

		try {

			sql = "select rownum rnum from lecture where id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, id);
			rs = ptmt.executeQuery();
			rs.next();
			rnum = rs.getInt(1);

		} catch(Exception e) {
			e.printStackTrace();
		}

		return rnum;
	}

	public int insert(VO vo) {
		int nextId = 0;

		try {
			sql = "select max(id)+1 from lecture";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			rs.next();
			nextId = rs.getInt(1);

			sql = "insert into lecture(id, cnt, reg_date, head, pname, title, content) "
					+ "values(?, ?, sysdate, ?, ?, ?, ?)";
			ptmt.setInt(1, nextId);
			ptmt.setInt(2, -1);
			ptmt.setString(3, "ch1");
			ptmt.setString(4, vo.getPname());
			ptmt.setString(5, vo.getTitle());
			ptmt.setString(6, vo.getContent());

			ptmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		}
		return nextId;
	}

	//로그인 성공시 pname, pid 담은 VO 리턴
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

	//회원가입 시 동일 id 존재 여부 확인 (중복이라면 false 리턴)
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

	//회원가입 시킨다
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


	//비밀번호 변경시 -- 기존비밀번호를 정확히 입력했는지 확인
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

	////비밀번호 변경시 -- 새 비밀번호로 업데이트
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

	//회원 탈퇴
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
	
//찬 qna랑 notice 리스트 종류랑 스타트와 엔드

	public ArrayList<VO> qnlist(String kind,int start, int end){ 

		ArrayList<VO> arr = new ArrayList<>();
		
		try {

			sql = "select * from (select rownum rnum, tt.* from (select * from info order by gid desc, seq) tt)"
					+ " where rnum >= ? and rnum <= ? and kind = ? " ;
			
			ptmt = con.prepareStatement(sql);
			
			ptmt.setInt(1, start);
			ptmt.setInt(2, end);
			ptmt.setString(3, kind);
			
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

	
	//kind별 게시물 토탈 개수
	
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
	
	//qna 디테일
	
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
	
	public void close() {
		if(rs!= null) try {rs.close();} catch(Exception e) {e.printStackTrace();}
		if(ptmt!= null) try {ptmt.close();} catch(Exception e) {e.printStackTrace();}
		if(con!= null) try {con.close();} catch(Exception e) {e.printStackTrace();}
	}
}