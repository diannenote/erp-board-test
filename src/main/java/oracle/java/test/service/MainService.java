package oracle.java.test.service;

import java.util.List;

import oracle.java.test.model.Member;
import oracle.java.test.model.Paging;

public interface MainService {

	List<Member> mainList(Paging paing);
	int insert(Member member);
	void delete(int no);
	Member memberinfo(int no);
	void update(Member member);
	int total(Paging paging);
	
}
