package devonframe.gyva.admin.contents.survey.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.service.ContentsService;
/**
 * <pre>
 * 사용자 정보에 대한 CRUD를 담당하는 Controller 클래스
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class AdminSurveyController {

    @Resource(name = "contentsService")
    private ContentsService contentsService;
    
    @RequestMapping(value="/admin/contents/question/retrieveQuestionList.do")
    public String retrieveQuestionList(Contents input, ModelMap model){
    	
    	//List<Contents> resultList = contentsService.retrieveContentsList(input);
        //model.addAttribute("resultList", resultList);
        
        return "admin/contents/survey/question/contentsList";
    }
    
    @RequestMapping(value="/admin/contents/result/retrieveResultList.do")
    public String retrieveResultList(Contents input, ModelMap model){
    	
    	//List<Contents> resultList = contentsService.retrieveContentsList(input);
        //model.addAttribute("resultList", resultList);
        
        return "admin/contents/survey/result/contentsList";
    }
	
}