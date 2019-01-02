package org.zerock.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAOImpl implements PointDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "org.zerock.mapper.PointMapper";
	
	@Override
	public void updatePoint(String uid, int point) throws Exception {
		
		System.out.println(uid);
		System.out.println(point);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("point", point);
		
		sqlSession.update(namespace+".updatePoint", paramMap);
	}

}
