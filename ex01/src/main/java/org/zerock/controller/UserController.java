package org.zerock.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.dto.JoinDTO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value = "/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model, HttpServletResponse response)throws Exception{
		
		UserVO vo = service.login(dto);
		
		if(vo == null) { response.sendRedirect("/user/login"); }
		
		model.addAttribute("userVO", vo);

		if(dto.isUseCookie()) {
			
			int amount = 60 * 60 * 24 * 7;
			
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			
			service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
		}
	
		response.sendRedirect("/sboard/listPage");
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)throws Exception{
		
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUid(), session.getId(), new Date());
			}
		}
		response.sendRedirect("/login");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET(@ModelAttribute("dto") JoinDTO dto) {
	}
	
	@RequestMapping(value="/joinPost", method=RequestMethod.POST)
	public void joinPOST(JoinDTO dto, HttpSession session, Model model, HttpServletResponse response)throws Exception{
		service.join(dto);
		response.sendRedirect("user/login");
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void mainGET(@ModelAttribute("dto") JoinDTO dto) {
	}

	@RequestMapping(value = "checkId", method = { RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody int idCheck(UserVO vo, Model model) throws Exception{
        return service.checkId(vo);
    }
	
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public void emailConfirm(String userEmail, Model model) throws Exception { // 이메일인증
		service.userAuth(userEmail);
		model.addAttribute("userEmail", userEmail);
	}
	
	@RequestMapping(value = "/findForm", method = RequestMethod.GET)
	public void findForm(String userEmail, Model model) throws Exception {
	}


	@RequestMapping(value = "/findId" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody String findingId(String uemail1, String uemail2, Model model , HttpServletResponse response)throws Exception {
		String findId =service.findId(uemail1, uemail2);
		model.addAttribute("findId", findId);
		String findEmail = "{\"user_id\":\""+findId+"\"}";
		System.out.println(findEmail);
		return findEmail;
	}
	
	@RequestMapping(value="/findPwd", method=RequestMethod.POST)
	public @ResponseBody String findingPwd(String uid, HttpSession session, Model model)throws Exception{
		boolean result = service.findPwd(uid);
		String findPwdOk=null;
		if(result) {
			findPwdOk = "{\"findPwd\":\""+"OK"+"\"}";
		}else {
			findPwdOk = "{\"findPwd\":\""+"NO"+"\"}";
		}
		
		return findPwdOk;
	}
	
	@RequestMapping(value = "/myRoom", method = RequestMethod.GET)
	public void myRoom(String userEmail, Model model) throws Exception {
	}
}
