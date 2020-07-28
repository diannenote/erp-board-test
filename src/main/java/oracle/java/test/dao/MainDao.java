package oracle.java.test.dao;

import java.util.List;

import oracle.java.test.model.Board;
import oracle.java.test.model.Member;
import oracle.java.test.model.Paging;

public interface MainDao {

	List<Member> mainList(Paging paging);
	int insert(Member member);
	void delete(String[] strArray);
	Member memberinfo(int no);
	void update(Member member);
	int total(Paging paging);
	int juminchk(Member member);
	void insertBoard(Board board);
	List<Board> getBoardList(String jumin);

}
