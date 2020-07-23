package oracle.java.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.test.dao.MainDao;
import oracle.java.test.model.Member;
import oracle.java.test.model.Paging;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;

	@Override
	public List<Member> mainList(Paging paging) {
		return mainDao.mainList(paging);
	}

	@Override
	public int insert(Member member) {
		return mainDao.insert(member);
	}

	@Override
	public Member memberinfo(int no) {
		return mainDao.memberinfo(no);
	}

	@Override
	public void update(Member member) {
		mainDao.update(member);	
	}

	@Override
	public int total(Paging paging) {
		return mainDao.total(paging);
	}

	@Override
	public void delete(String[] strArray) {
		System.out.println(strArray);
		mainDao.delete(strArray);
	}


	
}
