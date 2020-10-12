package devonframe.gyva.admin.contents.branding.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.service.ContentsService;

@Controller
public class AdminBrandingContentsController {

    @Resource(name = "contentsService")
    private ContentsService contentsService;
    
    @RequestMapping(value="/admin/contents/branding/retrieveContentsList.do")
    public String retrieveContentsList(Contents input, ModelMap model){

        if (contentsService.retrieveFrontMenuId(input) != null && !"".equals(contentsService.retrieveFrontMenuId(input))) {
        	input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
        }
    	
    	List<Contents> resultList = contentsService.retrieveContentsList(input);
        model.addAttribute("resultList", resultList);
        
        return "admin/contents/branding/contentsList";
    }
    
    @RequestMapping(value="/admin/contents/branding/retrieveContents.do")
    public String retrieveContentsDetail(Contents input, ModelMap model){

    	Contents contents = contentsService.retrieveContents(input);
    	
        model.addAttribute("result", contents);

        return "admin/contents/branding/contentsDetail";
    }
    
}
