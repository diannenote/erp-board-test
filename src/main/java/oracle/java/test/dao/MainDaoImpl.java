package oracle.java.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.test.model.Member;

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Member> mainList() {
		return session.selectList("mainList");
	}
}
