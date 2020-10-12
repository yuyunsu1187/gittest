package devonframe.gyva.admin.system.log.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import devonframe.gyva.admin.system.code.model.Code;
import devonframe.gyva.admin.system.code.service.CodeService;
import devonframe.gyva.admin.system.log.model.Log;
import devonframe.gyva.admin.system.log.service.LogService;
/**
 * <pre>
 * 사용자 정보에 대한 CRUD를 담당하는 Controller 클래스
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class AdminLogController {

	@Resource(name = "codeService")
	private CodeService codeService;

    @Resource(name = "logService")
    private LogService logService;
    
    @RequestMapping(value="/admin/system/logList.do")
    public String retrieveLogList(Log input, ModelMap model){
    	
    	List<Log> resultList = logService.retrieveLogList(input);

    	model.addAttribute("input", input);
        model.addAttribute("l1MuneList", codeService.retrieveL1MenuList());
        model.addAttribute("resultList", resultList);
        
        return "admin/system/log/list";
    }
    
    @ResponseBody
    @RequestMapping(value="/admin/system/log/retrieveL2MenuList_ajax.do")
    public Map<String,Object> retrieveL2MenuList(Code input, ModelMap model, HttpSession session) throws IOException {    	
    	
    	List<Code> resultList = codeService.retrieveL2MenuList(input);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", resultList);
		
    	return map;
  	
    }
}