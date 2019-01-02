package org.zerock.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.UserVO;
import org.zerock.dto.JoinDTO;
import org.zerock.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "org.zerock.mapper.UserMapper";
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return sqlSession.selectOne(namespace+".login", dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
	
		sqlSession.update(namespace+".keepLogin", paramMap);
	}
	

	@Override
	public UserVO checkUserWithSessionKey(String value) {
		
		return sqlSession.selectOne(namespace+".checkUserWithSessionKey", value);
	}

	@Override
	public void join(JoinDTO dto) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", dto.getUid());
		paramMap.put("upw", dto.getUpw());
		paramMap.put("uname", dto.getUname());
		paramMap.put("uaddress1", dto.getUaddress1());
		paramMap.put("uaddress2", dto.getUaddress2());
		paramMap.put("uaddress3", dto.getUaddress3());
		paramMap.put("uaddress4", dto.getUaddress4());
		paramMap.put("uemail1", dto.getUemail1());
		paramMap.put("uemail2", dto.getUemail2());
		paramMap.put("uphone", dto.getUphone());
		paramMap.put("uhometype", dto.getUhometype());
		paramMap.put("ustatus", dto.getUstatus());
	
		sqlSession.insert(namespace+".join", dto);
	}

	@Override
	public int checkId(UserVO vo) throws Exception {
		return sqlSession.selectOne(namespace+".checkId", vo);
	}
	
	@Override
	public void createAuthKey(String userEmail, String authKey) throws Exception { // ����Ű DB�� �ֱ�
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userEmail", userEmail);
		map.put("authKey", authKey);

		sqlSession.selectOne(namespace + ".createAuthKey", map);
	}

	@Override
	public void userAuth(String userEmail) throws Exception { // ����Ű ��ġ�� DBĮ��(��������) false->true �� ����
		// @�� �������� ���ڿ��� ������ ���̴�.
        String mail = userEmail;
        
        // ���� @ �� �ε����� ã�´�
        int idx = mail.indexOf("@"); 
        
        // @ �պκ��� ����
        // substring�� ù��° ������ �ε����� �������� �ʴ´�.
        // �Ʒ��� ���� ù��° ���ڿ��� a ���� ����ȴ�.
        String mail1 = mail.substring(0, idx);
      
        System.out.println("mail1 : "+mail1);

		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("userEmail", userEmail);
		paramMap.put("emailId", mail1);
		
		sqlSession.update(namespace + ".userAuth", paramMap);
	}

	@Override
	public String findId(String uemail1, String uemail2 ) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		System.out.println("�ؽ�"+uemail1);
		System.out.println("�ؽ�"+uemail2);
		paramMap.put("uemail1", uemail1);
		paramMap.put("uemail2", uemail2);
		System.out.println("����"+sqlSession.selectOne(namespace+".findId", paramMap));
		return sqlSession.selectOne(namespace+".findId", paramMap);
	}

	@Override
	public JoinDTO findPwd(String uid) throws Exception {
		return sqlSession.selectOne(namespace+".findPwd", uid);
	}
	
}
