package devonframe.gyva.front.mypage.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.service.ContentsService;

@Controller
public class BookmarkController {

    @Resource(name = "contentsService")
    private ContentsService contentsService;
    
    @RequestMapping(value="/mypage/bookmark/retrieveContentsList.do")
    public String retrieveContentsList(Contents input, ModelMap model, HttpSession session){
    	
    	input.setUserId((String) session.getAttribute("userId"));
    	List<Contents> resultList = contentsService.retrieveLikeContentsList(input);
        model.addAttribute("resultList", resultList);
        
        return "mypage/bookmarks/contentsList";
    }
    
    @RequestMapping(value="/mypage/bookmark/deleteBookmark.do")
    public String retrieveContentsDetail(Contents input, ModelMap model){

    	Contents contents = contentsService.retrieveContents(input);
    	
        model.addAttribute("result", contents);

        return "redirect:/mypage/bookmark/retrieveContentsList.do";
    }
    
}
