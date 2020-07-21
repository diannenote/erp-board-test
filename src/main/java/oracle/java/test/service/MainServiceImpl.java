package oracle.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.test.dao.MainDao;
import oracle.java.test.model.Member;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;

	@Override
	public List<Member> mainList() {
		return mainDao.mainList();
	}

	@Override
	public int insert(Member member) {
		return mainDao.insert(member);
	}
}
