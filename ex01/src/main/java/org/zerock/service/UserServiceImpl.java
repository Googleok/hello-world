package org.zerock.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.UserVO;
import org.zerock.dto.JoinDTO;
import org.zerock.dto.LoginDTO;
import org.zerock.persistence.UserDAO;
import org.zerock.util.MailHandler;
import org.zerock.util.TempKey;

@Service
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		dao.keepLogin(uid, sessionId, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionKey(value);
	}
	
	@Override
	public int checkId(UserVO vo) throws Exception {
		return dao.checkId(vo);
	}

	@Transactional
	@Override
	public void join(JoinDTO dto) throws Exception {
		dao.join(dto);
		String user_email = dto.getUemail1()+"@"+dto.getUemail2();
		
		String key = new TempKey().getKey(50, false); // 인증키 생성
		dao.createAuthKey(user_email, key); // 인증키 DB저장
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[홈페이지 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/user/emailConfirm?userEmail=").append(user_email).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("qkrwhddjr3@gmail.com", "Makers");
		sendMail.setTo(user_email);
		sendMail.send();
	}

	@Override
	public void userAuth(String userEmail) throws Exception {
		dao.userAuth(userEmail);
	}

	@Override
	public String findId(String uemail1, String uemail2) throws Exception {
		return dao.findId(uemail1, uemail2);
	}

	@Override
	public boolean findPwd(String uid) throws Exception {
		JoinDTO dto1= dao.findPwd(uid);
		
		if(dto1.getUid()==null) return false;
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Makers 비밀번호 찾기]");
		sendMail.setText(
				new StringBuffer().append("<h1>고객님의 비밀 번호는</h1>").append(dto1.getUpw()).append("입니다").toString());
		sendMail.setFrom("qkrwhddjr3@gmail.com", "Makers");
		sendMail.setTo(dto1.getUemail1()+"@"+dto1.getUemail2());
		sendMail.send();
		
		return true;
	}
	

}
