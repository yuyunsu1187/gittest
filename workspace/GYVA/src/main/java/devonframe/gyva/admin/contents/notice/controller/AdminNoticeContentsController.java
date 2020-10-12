package devonframe.gyva.admin.contents.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.front.common.code.map.service.CodeService;
import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.notice.service.NoticeContentsService;
import devonframe.paging.model.PagingMap;
import devonframe.paging.policy.annotation.PagingPolicy;

@Controller("adminListToDetailContentsForMapAndWebPagingController")
public class AdminNoticeContentsController {
    
    @Resource(name = "contentsServiceForMap")
    private NoticeContentsService contentsService;

    @Resource(name = "codeServiceForMap")
    private CodeService codeService;

    @RequestMapping(value="/admin/contents/notice/retrieveContentsList.do")
    public String retrieveContentsList(@PagingPolicy("policy2")PagingMap pagingMap, ModelMap model, HttpSession session){

    	String frMenuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
    	
    	Map<String, Object> menuId = new HashMap<String, Object>();
    	menuId.put("menuId", frMenuId);
        if (contentsService.retrieveFrontMenuId(menuId) != null && !"".equals(contentsService.retrieveFrontMenuId(menuId))) {
        	frMenuId = (String)  contentsService.retrieveFrontMenuId(menuId).getMenuId();
        	pagingMap.getMap().replace("menuId", frMenuId); 
        }        

        Map<String, Object> codeGroup = new HashMap<String, Object>();
        codeGroup.put("codeGroup", frMenuId);
        List<Map<String, Object>> resultList = contentsService.retrieveContentsPagedList(pagingMap);

        model.addAttribute("input", pagingMap.getMap());
        model.addAttribute("resultList", resultList);
        model.addAttribute("categoryCode", codeService.retrieveCategoryCodeList(codeGroup));

        return "admin/contents/news/notice/contentsList";
    }

    @RequestMapping(value="/admin/contents/notice/retrieveContents.do")
    public String retrieveContents(Contents input, ModelMap model){

    	Contents contents = contentsService.retrieveContents(input);
    	
        model.addAttribute("result", contents);

        return "admin/contents/news/notice/contentsDetail";
    }
}
