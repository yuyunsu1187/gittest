package devonframe.gyva.common.login.controller;

import java.security.SecureRandom;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import devonframe.gyva.admin.system.code.model.Code;
import devonframe.gyva.admin.system.code.service.CodeService;
import devonframe.gyva.common.login.service.LoginService;
import devonframe.gyva.common.user.model.User;
import devonframe.gyva.common.user.service.UserService;

/**
 * <pre>
 * 본 클래스는 로그인 처리를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
    @Resource(name="messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    // 회원 가입 page
	@RequestMapping(value="/register.do")
	public String joinForm(ModelMap model, Code code, HttpSession session){
		String deviceType = (String) session.getAttribute("deviceType");	
		String returnUrl = "common/login/joinForm";	
		
		code.setCodeGroup("COUNTRY");
		List<Code> countryCodeList = codeService.retrieveCodeList(code);
		code.setCodeGroup("SPECIAL");
		List<Code> specialCodeList = codeService.retrieveCodeList(code);
		
        model.addAttribute("countryCodeList", countryCodeList);
        model.addAttribute("specialCodeList", specialCodeList);

        if (deviceType != null && deviceType.equals("mobile")) {        
        	returnUrl =  "mobile/login/joinForm";        
        }
        
        return returnUrl;        
	}
	
	// 회원 비밀번호 리셋 page
	@RequestMapping(value="/resetPassword.do")
	public String resetPasswordForm(ModelMap model, HttpSession session){
		String deviceType = (String) session.getAttribute("deviceType");	
		String returnUrl = "common/login/resetPassword";	

        if (deviceType != null && deviceType.equals("mobile")) {        
        	returnUrl =  "mobile/login/resetPassword";        
        }
        
		return returnUrl;
	}
	
    // 로그인 page
	@RequestMapping("/loginForm.do")
	public String loginForm(@ModelAttribute User input, ModelMap model, HttpSession session) {		
		String loginChk = (String) session.getAttribute("userId");
    	String deviceType = input.getDeviceType();
		String returnUrl = "common/login/loginForm";
        session.setAttribute("deviceType", deviceType);
		
		if (loginChk == null) {
		    if (deviceType != null && deviceType.equals("mobile")) {        
		    	returnUrl =  "mobile/login/loginForm";        
		    }
		    
		    return returnUrl;
		} else {
			return "redirect:/main.do";
		}
	}
	
    // 로그인 page
	@RequestMapping("/mobile/loginForm.do")
	public String mobileLoginForm(@ModelAttribute User input, ModelMap model, HttpSession session) {
		String loginChk = (String) session.getAttribute("userId");
        session.setAttribute("deviceType", "mobile");
		
		if (loginChk == null) {        
			return "mobile/login/loginForm";
		} else {
			return "redirect:/main.do";
		}
	}

	// 로그아웃
    @RequestMapping("/logout.do")
    public String logout(@ModelAttribute User input, ModelMap model, HttpSession session) {
		String deviceType = (String) session.getAttribute("deviceType");	
		String returnUrl = "redirect:/loginForm.do";	
    	
    	session.removeAttribute("loginUser");
    	session.removeAttribute("email");
    	session.removeAttribute("fullName");
    	session.removeAttribute("userId");
    	session.removeAttribute("userType");
    	session.removeAttribute("deviceType");

        if (deviceType != null && deviceType.equals("mobile")) {        
        	returnUrl =  "redirect:/mobile/loginForm.do";        
        }
    	
		return returnUrl;		
    }

    // 로그인
    @RequestMapping("/login.do")
    public String login(@ModelAttribute User input, Code code, ModelMap model, HttpSession session) {
    	String deviceType = input.getDeviceType();
		String returnUrl = "login";
    	code.setGroupId("LOGINERR");
    	    	
        boolean isExistUser = loginService.checkUserId(input);
        if(!isExistUser) {
        	code.setCode("login_01");        	
        	Code codeResult = codeService.retrieveDetailCodeDetail(code);        	
        	
            model.addAttribute("errorMsg", codeResult.getCodeName());

            if (deviceType != null && deviceType.equals("mobile")) {            
            	returnUrl = "mobile/login";            
            }
            
            return returnUrl;            
        }
    	
		boolean isNotConfirmUser = loginService.checkConfirmUserId(input);
		if(!isNotConfirmUser) {
        	code.setCode("login_02");        	
        	Code codeResult = codeService.retrieveDetailCodeDetail(code);        	
        	
            model.addAttribute("errorMsg", codeResult.getCodeName());
		
		    if (deviceType != null && deviceType.equals("mobile")) {            
		    	returnUrl = "mobile/login";            
		    }
		    
		    return returnUrl;            
		}

        boolean isValidUser = loginService.checkUser(input);
        if(isValidUser) {
        	User loginUser = userService.retrieveUser(input);

        	// language대신 국가 코드 세팅 차후 삭제 가능
        	String language = loginUser.getCountryCode(); 
        	if(language == null) {
        		language = "";
        	}

            session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale(language));
            session.setAttribute("loginUser", loginUser);
            session.setAttribute("email", loginUser.getEmail());
            session.setAttribute("fullName", loginUser.getNameFirst() + " " + loginUser.getNameLast());
            session.setAttribute("userId", loginUser.getSeq());
            session.setAttribute("userType", loginUser.getUserType());
            
        	return "redirect:/main.do";
        }

    	code.setCode("login_03");    	
    	Code codeResult = codeService.retrieveDetailCodeDetail(code);        	
    	
        model.addAttribute("errorMsg", codeResult.getCodeName());

        if (deviceType != null && deviceType.equals("mobile")) {        
        	returnUrl = "mobile/login";        
        } 
        	
       	return returnUrl;            
    }
    
    // 회원 비밀번호 초기화 + email 발송
 	@RequestMapping(value = "/common/login/resetPwdUser.do")
 	public String resetPwdUser(User input, Code code, ModelMap model, HttpSession session) {
		String deviceType = (String) session.getAttribute("deviceType");	
		String returnUrl = "redirect:/loginForm.do";	
		
 		boolean idCheck = loginService.checkUserId(input);	// 아이디  존재 여부 조회 있을 경우 다음 로직 실행
 		if(idCheck){ 			
 			// Random 변수 생성
 			SecureRandom rnd = new SecureRandom();
 			int numLength = 9;
 			String randomStr = "";

 			for (int i = 0; i < numLength; i++) {
 				randomStr += rnd.nextInt(10);
 			}

 			input.setPassword(randomStr);
 			userService.updateUserPassword(input);
 		}else{
 	    	//code.setGroupId("LOGINERR");
        	//code.setCode("login_01");        	
        	//Code codeResult = codeService.retrieveDetailCodeDetail(code);        	
        	
            //model.addAttribute("errorMsg", codeResult.getCodeName());
 		}

        if (deviceType != null && deviceType.equals("mobile")) {        
        	returnUrl =  "redirect:/mobile/loginForm.do";        
        }
        
 		return returnUrl;
 	}

    // 회원 파일 정보 노출 페이지
	@RequestMapping(value="/common/login/fileDownload.do")
	public String fileDownload(@ModelAttribute User input, ModelMap model, HttpSession session) {
		return "common/fileDownload";
	}
	
	// 세션만료 시
	@RequestMapping(value="/lostSession.do")
	public String lostSession( ModelMap model) {
		return "common/error/lostSession";
	}
	
}