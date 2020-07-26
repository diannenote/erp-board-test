package oracle.java.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.test.model.Board;
import oracle.java.test.model.Member;
import oracle.java.test.model.Paging;

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Member> mainList(Paging paging) {
		return session.selectList("mainList", paging);
	}

	@Override
	public int insert(Member member) {
		return session.insert("insert", member);
	}

	@Override
	public Member memberinfo(int no) {
		return session.selectOne("memberinfo", no);
	}

	@Override
	public void update(Member member) {
		session.update("update", member);		
	}

	@Override
	public int total(Paging paging) {
		return session.selectOne("total", paging);
	}

	@Override
	public void delete(String[] strArray) {
		System.out.println(strArray);
		session.delete("delete", strArray);		
	}

	@Override
	public int juminchk(Member member) {
		return session.selectOne("juminchk", member);
	}

	@Override
	public void insertBoard(Board board) {
		session.insert("insertBoard", board);
	}

	@Override
	public List<Board> getBoardList() {
		return session.selectList("selectBoardList");
	}
	
}
