package devonframe.gyva.front.contents.clinic.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.front.common.menu.model.Menu;
import devonframe.gyva.front.common.menu.service.MenuService;
import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.service.ContentsService;

@Controller
public class ClinicContentsController {
    
    @Resource(name = "menuService")
    private MenuService menuService;

    @Resource(name = "contentsService")
    private ContentsService contentsService;
    
    @RequestMapping(value="/contents/clinic/retrieveContentsList.do")
    public String retrieveContentsList(Contents input, ModelMap model, HttpSession session){
    	System.out.println("\t\t\t ################################# retrieveContentsList ");
		
		Menu menu = new Menu();
		menu.setUserId((String) session.getAttribute("userId"));
		menu.setMenuId((String) session.getAttribute("MenuInfoInterceptor_menuId"));
		menu.setContentsId((String) input.getContentsId());
		
		menuService.insertLog(menu);
		
    	List<Contents> resultList = contentsService.retrieveContentsList(input);
        model.addAttribute("resultList", resultList);
        
        return "contents/library/clinic/contentsList";
    }
    
    @RequestMapping(value="/contents/clinic/retrieveContents.do")
    public String retrieveContentsDetail(Contents input, ModelMap model, HttpSession session){
    	System.out.println("\t\t\t ################################# retrieveContentsDetail ");
		
		Menu menu = new Menu();
		menu.setUserId((String) session.getAttribute("userId"));
		menu.setMenuId((String) session.getAttribute("MenuInfoInterceptor_menuId"));
		menu.setContentsId((String) input.getContentsId());
		
		menuService.insertLog(menu);
		
    	Contents contents = contentsService.retrieveContents(input);
    	
        model.addAttribute("result", contents);

        return "contents/library/clinic/contentsDetail";
    }
    
}
