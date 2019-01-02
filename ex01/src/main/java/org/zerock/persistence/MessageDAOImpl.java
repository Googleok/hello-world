package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "org.zerock.mapper.MessageMapper";
	
	@Override
	public void create(MessageVO vo) throws Exception {
		System.out.println(vo.getMessage());
		System.out.println(vo.getSender());
		System.out.println(vo.getTargetid());
		
		sqlSession.insert(namespace+".create", vo);
	}

	@Override
	public MessageVO readMessage(Integer mid) throws Exception {
		return sqlSession.selectOne(namespace+".readMessage", mid);
	}

	@Override
	public void updateState(Integer mid) throws Exception {
		sqlSession.update(namespace+".updateState", mid);
	}

}
