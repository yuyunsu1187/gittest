package devonframe.gyva.mypage.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import devonframe.gyva.admin.contents.survey.model.Survey;
import devonframe.gyva.admin.contents.survey.service.SurveyService;
import devonframe.gyva.admin.system.code.model.Code;
import devonframe.gyva.admin.system.code.service.CodeService;
import devonframe.gyva.admin.system.log.model.Log;
import devonframe.gyva.admin.system.log.service.LogService;
import devonframe.gyva.admin.user.helpdesk.model.Helpdesk;
import devonframe.gyva.admin.user.helpdesk.service.HelpdeskService;
import devonframe.gyva.common.menu.model.Menu;
import devonframe.gyva.common.menu.service.MenuService;
import devonframe.gyva.contents.model.Contents;
import devonframe.gyva.contents.service.ContentsService;

@Controller
public class BookmarkController {
    
    @Resource(name = "logService")
    private LogService logService;
    
    @Resource(name = "menuService")
    private MenuService menuService;
	@Resource(name = "codeService")
	private CodeService codeService;

    @Resource(name = "helpdeskService")
    private HelpdeskService helpdeskService;

    @Resource(name = "surveyService")
    private SurveyService surveyService;

    @Resource(name = "contentsService")
    private ContentsService contentsService;
    
    @RequestMapping(value="/mypage/bookmarkList.do")
    public String retrieveContentsList(Contents input, ModelMap model, HttpSession session){
	
    	String loginChk = (String) session.getAttribute("userId");
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = "mypage/bookmarks/contentsList";
    	
    	if (loginChk != null) {
    	
	    	input.setUserId((String) session.getAttribute("userId"));
	    	List<Contents> resultList = contentsService.retrieveBookmarkContentsList(input);
	        model.addAttribute("resultList", resultList);
			
			if (deviceType != null && deviceType.equals("mobile")) {
				
				returnUrl = deviceType + "/" + returnUrl;
				
			}
	        
	        return returnUrl;
			
		} else {    		
		
			return "redirect:/lostSession.do";  
			
		} 	
	
    }
    
    @RequestMapping(value="/mypage/bookmarkDetail.do")
    public String retrieveContentsDetail(Contents input, Code code, ModelMap model, HttpSession session){
	    	
		Menu menu = menuService.retrieveCallMenuInfo(input);
		
		String loginChk = (String) session.getAttribute("userId");
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = menu.getDetailUrl();

		if (loginChk != null) {
	
			Log log = new Log();
			log.setUserId((String) loginChk);
			log.setMenuId((String) input.getMenuId());
			log.setContentsId((String) input.getContentsId());
			log.setCategoryCode((String) input.getCategoryCode());

			logService.insertLog(log);

	    	input.setUserId(loginChk);
	    	Contents result = contentsService.retrieveContents(input);

	    	Helpdesk helpdeskInput = new Helpdesk();
	    	helpdeskInput.setStateCode(null);
	    	helpdeskInput.setUserId(input.getUserId());
	    	helpdeskInput.setMenuId(input.getMenuId());
	    	helpdeskInput.setContentsId(input.getContentsId());	    	
	    	List<Helpdesk> helpdeskList = helpdeskService.retrieveHelpdeskContentsList(helpdeskInput);	  
			
	    	Survey surveyInput = new Survey();
	    	surveyInput.setSurveyId(result.getSurveyId());
	    	Survey surveyList = surveyService.retrieveQuestionDetail(surveyInput);  	

			code.setCodeGroup("MC");
			List<Code> mcCodeList = codeService.retrieveCodeList(code);				   	

	        model.addAttribute("input", input);
	        model.addAttribute("menu", menu);
	        model.addAttribute("result", result);
	        model.addAttribute("helpdeskList", helpdeskList);
	        model.addAttribute("surveyList", surveyList);
	        model.addAttribute("mcCodeList", mcCodeList);	 
			
			if (deviceType != null && deviceType.equals("mobile")) {
				
				returnUrl = deviceType + "/" + returnUrl;
				
			}
	        
			return returnUrl;
		
    	} else {    		
		
    		return "common/error/lostSession";  
			
    	} 	
    	
    }
    
    @RequestMapping(value="/mypage/bookmark/deleteBookmark.do")
    public String retrieveContentsDetail(Contents input, ModelMap model, HttpSession session){
    	
    	input.setUserId((String)session.getAttribute("userId"));  
    	input.setMenuId(input.getBookmarkMenuId());
    	String menuId = input.getMenuId();
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = "mypage/bookmarks/contentsList";

    	contentsService.updateBookmark(input);

    	List<Contents> resultList = contentsService.retrieveBookmarkContentsList(input);
        model.addAttribute("resultList", resultList);
                
    	input.setMenuId(menuId);
        model.addAttribute("input", input);
		
		if (deviceType != null && deviceType.equals("mobile")) {
			
			returnUrl = deviceType + "/" + returnUrl;
			
		}

    	return returnUrl;
	
    }
    
    @ResponseBody
	@RequestMapping(value = "/contents/updateBookmark.do")
	public int updateBookmark(Contents input, ModelMap model, HttpSession session) {
    	
    	input.setUserId((String)session.getAttribute("userId"));     	
    	
    	int result = contentsService.updateBookmark(input);
    	
		return result;
	}
    
}
