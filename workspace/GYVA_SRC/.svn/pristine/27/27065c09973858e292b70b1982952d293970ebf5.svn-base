package devonframe.gyva.contents.about.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.admin.system.log.service.LogService;
import devonframe.gyva.common.menu.model.Menu;
import devonframe.gyva.common.menu.service.MenuService;
import devonframe.gyva.contents.model.Contents;

@Controller
public class AboutController {
    
    @Resource(name = "logService")
    private LogService logService;
    
    @Resource(name = "menuService")
    private MenuService menuService;
	
	@RequestMapping(value="/contents/introduceDetail.do")
	public String retrieveIntroduce(Contents input, ModelMap model, HttpSession session){
	
		Menu menu = menuService.retrieveCallMenuInfo(input);
		
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = menu.getDetailUrl();
		
		if (deviceType != null && deviceType.equals("mobile")) {
			
			returnUrl = deviceType + "/" + returnUrl;
			
		}
		
		return returnUrl;
	}
	
	@RequestMapping(value="/contents/contactDetail.do")
	public String retrieveContents(Contents input, ModelMap model, HttpSession session){
	
		Menu menu = menuService.retrieveCallMenuInfo(input);
		
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = menu.getDetailUrl();
		
		if (deviceType != null && deviceType.equals("mobile")) {
			
			returnUrl = deviceType + "/" + returnUrl;
			
		}
		
		return returnUrl;
	}
	
}
