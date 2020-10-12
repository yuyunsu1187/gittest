package devonframe.gyva.front.contents.anatomy.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import devonframe.gyva.front.common.menu.service.MenuService;
import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.service.ContentsService;

@Controller
public class AnatomyContentsController {

    @Resource(name = "contentsService")
    private ContentsService contentsService;
    
    @Resource(name = "menuService")
    private MenuService menuService;

    
    @RequestMapping(value="/contents/anatomy/retrieveContentsList.do")
    public String retrieveContentsList(Contents input, ModelMap model, HttpSession session){
    	
//    	List<Contents> resultList = contentsService.retrieveContentsList(input);
//      model.addAttribute("resultList", resultList);
//    	String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
//		input.setMenuId(menuId);
		model.addAttribute("selectedCategoryCode", input.getCategoryCode());
    	
		//session.getAttribute("MenuInfoInterceptor_mainMenuId");
		
        input.setUserId((String)session.getAttribute("userId"));
        input.setCategoryCode("01");
        List<Contents> upperList = contentsService.retrieveContentsList(input);
        
        input.setCategoryCode("02");
        List<Contents> midList = contentsService.retrieveContentsList(input);
        
        input.setCategoryCode("03");
        List<Contents> lowList = contentsService.retrieveContentsList(input);
        
        model.addAttribute("upperList", upperList);
        model.addAttribute("midList", midList);
        model.addAttribute("lowList", lowList);
        
        return "contents/academy/anatomy/contentsList";
    }
    
    @RequestMapping(value="/contents/anatomy/retrieveContents.do")
    public String retrieveContentsDetail(Contents input, ModelMap model, HttpSession session, String mode){
    	
    	System.out.println("===================== mode : " + mode);
    	
    	input.setUserId((String)session.getAttribute("userId"));
    	Contents contents = contentsService.retrieveContents(input);
    	String categoryCode = contents.getCategoryCode();
    	input.setCategoryCode(categoryCode);
    	
    	String nextContentsId = null;
    	if (mode != null && !mode.equals("")) {
    		if (mode.equals("previous")) {
    			nextContentsId = contentsService.retrieveBiggestContentsId(input);
    		} else {
    			nextContentsId = contentsService.retrieveSmallestContentsId(input);
    		}
    		input.setContentsId(nextContentsId);
    		contents = contentsService.retrieveContents(input);
    		input.setContentsId(null);
    	}
    	
    	String biggestContentsId = contentsService.retrieveBiggestContentsId(input);
    	String smallestContentsId = contentsService.retrieveSmallestContentsId(input);
    	
        model.addAttribute("result", contents);
        model.addAttribute("biggestContentsId", biggestContentsId);
        model.addAttribute("smallestContentsId", smallestContentsId);

        return "contents/academy/anatomy/contentsDetail";
    }
    
    @ResponseBody
	@RequestMapping(value = "/contents/anatomy/updateLikeDislike.do")
	public Contents updateLikeDislike(Contents input, ModelMap model, HttpSession session) {
    	
    	System.out.println("\t\t\t ################################# updateLikeDislike ");
    	input.setUserId((String)session.getAttribute("userId"));
    	System.out.println("before logic input ========== " + input.toString());
    	
    	
    	Contents contents = contentsService.retrieveContents(input);
    	System.out.println("contents.dislikeYn ===== " + contents.getDislikeYn());
    	
    	if (contents.getDislikeYn() != null && contents.getDislikeYn() != "") {   		
    		contentsService.updateLikeDislike(contents);
    	} else {
    		System.out.println("insert logic input ========== " + input.toString());
    		contentsService.insertLikeDislike(input);   		
    	}
    	
    	System.out.println("\t\t\t ### updateLikeDislike END ");
    	contents = contentsService.retrieveContents(input);
		return contents;
	}
}
