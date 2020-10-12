package devonframe.gyva.front.contents.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.front.common.code.map.service.CodeService;
import devonframe.gyva.front.common.menu.model.Menu;
import devonframe.gyva.front.common.menu.service.MenuService;
import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.notice.service.NoticeContentsService;
import devonframe.paging.model.PagingMap;
import devonframe.paging.policy.annotation.PagingPolicy;

@Controller("listToDetailContentsForMapAndWebPagingController")
public class NoticeContentsController {
    
    @Resource(name = "menuService")
    private MenuService menuService;
    
    @Resource(name = "contentsServiceForMap")
    private NoticeContentsService contentsService;

    @Resource(name = "codeServiceForMap")
    private CodeService codeService;

	@RequestMapping(value="/contents/notice/retrieveContentsList.do")
    public String retrieveContentsList(@PagingPolicy("policy2")PagingMap pagingMap, ModelMap model, HttpSession session){

    	String loginChk = (String) session.getAttribute("email");
    	
    	if (loginChk != null) {
    		
    		Menu menu = new Menu();
    		menu.setUserId((String) session.getAttribute("userId"));
    		menu.setMenuId((String) session.getAttribute("MenuInfoInterceptor_menuId"));
    		menu.setContentsId((String) session.getAttribute("contentsId"));
    		
    		menuService.insertLog(menu);
    		
            Map<String, Object> codeGroup = new HashMap<String, Object>();
            codeGroup.put("codeGroup", (String) session.getAttribute("MenuInfoInterceptor_menuId"));
            List<Map<String, Object>> resultList = contentsService.retrieveContentsPagedList(pagingMap);

            model.addAttribute("input", pagingMap.getMap());
            model.addAttribute("resultList", resultList);
            model.addAttribute("categoryCode", codeService.retrieveCategoryCodeList(codeGroup));

            return "contents/news/notice/contentsList";
    		
    	} else {
    		
    		return "redirect:/common/login/login.do";
    		
    	}
    }

    @RequestMapping(value="/contents/notice/retrieveContents.do")
    public String retrieveContents(Contents input, ModelMap model, HttpSession session){
		
		Menu menu = new Menu();
		menu.setUserId((String) session.getAttribute("userId"));
		menu.setMenuId((String) session.getAttribute("MenuInfoInterceptor_menuId"));
		menu.setContentsId((String) input.getContentsId());
		
		menuService.insertLog(menu);

    	Contents contents = contentsService.retrieveContents(input);
    	
        model.addAttribute("result", contents);

        return "contents/news/notice/contentsDetail";
    }
}
