package devonframe.gyva.common.footer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <pre>
 * 본 클래스는 로그인 처리를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class FooterController {
	
	@RequestMapping(value="/contents/introduce.do")
	public String retrieveTerms(ModelMap model){
		return "contents/about/introduce/contentsDetail";
	}
	
	@RequestMapping(value="/contents/contact.do")
	public String retrievePrivacy(ModelMap model){
		return "contents/about/contact/contentsDetail";
	}
	
}
