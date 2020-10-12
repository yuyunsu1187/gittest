package devonframe.gyva.admin.system.log.controller;

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
public class AdminLogController {

    @Resource(name = "contentsService")
    private ContentsService contentsService;
    
    @RequestMapping(value="/admin/system/log/retrieveLogList.do")
    public String retrieveLogList(Contents input, ModelMap model){
    	
    	//List<Contents> resultList = contentsService.retrieveContentsList(input);
        //model.addAttribute("resultList", resultList);
        
        return "admin/system/log/list";
    }
	
}