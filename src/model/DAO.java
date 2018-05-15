package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			DataSource ds = (DataSource)init.lookup("java/comp/env/oracleDB");
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

	public String loginReg(VO vo) {

		sql = "select pname from member where pid=? and pw=?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, vo.getPid());
			ptmt.setString(2, vo.getPw());
			rs = ptmt.executeQuery();

			if(rs.next()) {
				System.out.println("login 성공");
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "";

	}

	public void close() {
		if(rs!= null) try {rs.close();} catch(Exception e) {e.printStackTrace();}
		if(ptmt!= null) try {ptmt.close();} catch(Exception e) {e.printStackTrace();}
		if(con!= null) try {con.close();} catch(Exception e) {e.printStackTrace();}
	}
}
