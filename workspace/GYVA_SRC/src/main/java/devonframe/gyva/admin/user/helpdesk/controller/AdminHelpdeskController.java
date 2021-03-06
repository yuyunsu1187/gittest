package devonframe.gyva.admin.user.helpdesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.admin.system.code.service.CodeService;
import devonframe.gyva.admin.user.helpdesk.model.Helpdesk;
import devonframe.gyva.admin.user.helpdesk.model.PagingHelpdesk;
import devonframe.gyva.admin.user.helpdesk.service.HelpdeskService;
import devonframe.gyva.contents.service.ContentsService;
import devonframe.paging.policy.annotation.PagingPolicy;
/**
 * <pre>
 * 1:1문의에 대한 CRUD를 담당하는 Controller 클래스
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class AdminHelpdeskController {

	@Resource(name = "codeService")
	private CodeService codeService;

    @Resource(name = "contentsService")
    private ContentsService contentsService;

    @Resource(name = "helpdeskService")
    private HelpdeskService helpdeskService;
    
    @RequestMapping(value="/mypage/helpdeskList.do")
    public String retrieveContentsList(Helpdesk input, ModelMap model, HttpSession session){
    	
    	input.setUserId((String) session.getAttribute("userId"));
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = "mypage/helpdesk/contentsList";
    	
    	List<Helpdesk> resultList = helpdeskService.retrieveHelpdeskContentsList(input);
        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
		
		if (deviceType != null && deviceType.equals("mobile")) {
			
			returnUrl = deviceType + "/" + returnUrl;
			
		}
        
        return returnUrl;
    }  
	
	@RequestMapping(value="/mypage/helpdesk/updateQuestionInfo.do")
	public String updateQuestionInfo(Helpdesk input, ModelMap model, HttpSession session){
    			
		if(input.getType().equals("D")) {
			input.setAnswerContents(null);
			input.setAnswerDate(null);
			input.setStateCode("01");			
		} else if(input.getType().equals("S")) {
			input.setStateCode("02");			
		} 
		
		helpdeskService.updateQuestionInfo(input);

		input.setStateCode(null);

    	List<Helpdesk> resultList = helpdeskService.retrieveHelpdeskContentsList(input);   	

		model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        
        return "mypage/helpdesk/contentsList";
		
	} 
    
    @RequestMapping(value="/admin/user/helpdeskList.do")
    public String retrievehelpdeskList(@PagingPolicy("policy2")PagingHelpdesk input, ModelMap model, HttpSession session){
    	
    	List<Helpdesk> resultList = helpdeskService.retrieveHelpdeskContentsPagedList(input);
    	
        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        
        return "admin/user/helpdesk/list";
    }
	
}