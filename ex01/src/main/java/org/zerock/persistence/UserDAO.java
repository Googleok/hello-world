package org.zerock.persistence;

import java.util.Date;

import org.zerock.domain.UserVO;
import org.zerock.dto.JoinDTO;
import org.zerock.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto)throws Exception;

	public void keepLogin(String uid, String sessionId, Date next);
	
	public UserVO checkUserWithSessionKey(String value);
	
	public void join(JoinDTO dto)throws Exception;
	
	public int checkId(UserVO vo)throws Exception;
	
	public void createAuthKey(String userEmail, String authKey) throws Exception;
	
	public void userAuth(String userEmail) throws Exception;
	
	public String findId(String uemail1, String uemail2 )throws Exception;
	
	public JoinDTO findPwd(String uid) throws Exception;
}
