package devonframe.gyva.admin.system.code.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.gyva.admin.system.code.model.Code;
import devonframe.gyva.admin.system.code.service.CodeService;
/**
 * <pre>
 * 사용자 정보에 대한 CRUD를 담당하는 Controller 클래스
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class AdminCodeController {

    @Resource(name = "codeService")
    private CodeService codeService;
    
    @RequestMapping(value="/admin/system/groupCodeList.do")
    public String retrieveQuestionList(ModelMap model, HttpSession session){
		String loginChk = (String) session.getAttribute("userId");
		    	
    	if (loginChk != null) { 
    	
	    	List<Code> resultList = codeService.retrieveGroupCodeList();
	        model.addAttribute("resultList", resultList);
	        
	        return "admin/system/code/group/list";
    	} else {    		
    		return "redirect:/lostSession.do";   		
    	} 	
    }

    @RequestMapping(value="/admin/system/groupCodeForm.do") 
    public String retrieveGroupCodeForm(HttpSession session){
		String loginChk = (String) session.getAttribute("userId");
		    	
    	if (loginChk != null) { 

    		return "admin/system/code/group/write";
    	} else {    		
    		return "redirect:/lostSession.do";   		
    	} 	
    }
    
    @RequestMapping(value="/admin/system/group/retrieveGroupCodeWrite.do")
    public String retrieveGroupCodeWrite(Code input, ModelMap model, HttpSession session){

		input.setUserId((String) session.getAttribute("userId"));

		codeService.insertGroupCode(input);

        return "redirect:/admin/system/groupCodeList.do";
    }

    @RequestMapping(value="/admin/system/groupCodeDetail.do")
    public String retrieveGroupCodeDetail(Code input, ModelMap model, HttpSession session){
		String loginChk = (String) session.getAttribute("userId");
		    	
    	if (loginChk != null) { 
		
	    	Code result = codeService.retrieveGroupCodeDetail(input);
	
	        model.addAttribute("result", result);
	
	        return "admin/system/code/group/update";
    	} else {    		
    		return "redirect:/lostSession.do";   		
    	} 	
    }
    
	@RequestMapping(value="/admin/system/group/retrieveGroupCodeUpdate.do")
    public String retrieveGroupCodeUpdate(Code input, ModelMap model, HttpSession session){

		input.setUserId((String) session.getAttribute("userId"));

		codeService.updateGroupCode(input);
    	
        return "redirect:/admin/system/groupCodeList.do";
    }
    
    @RequestMapping(value="/admin/system/detailCodeList.do")
    public String retrieveDetailList(ModelMap model, HttpSession session){
		String loginChk = (String) session.getAttribute("userId");
		    	
    	if (loginChk != null) { 
    	
	    	List<Code> resultList = codeService.retrieveDetailCodeList();
	        model.addAttribute("resultList", resultList);
	        
	        return "admin/system/code/detail/list";
    	} else {    		
    		return "redirect:/lostSession.do";   		
    	} 	
    }

    @RequestMapping(value="/admin/system/detailCodeForm.do") 
    public String retrieveDetailCodeForm(ModelMap model, HttpSession session){
		String loginChk = (String) session.getAttribute("userId");
		    	
    	if (loginChk != null) { 

	    	List<Code> groupCodeList = codeService.retrieveGroupList();   	
	
	        model.addAttribute("groupCodeList", groupCodeList);
	
	    	return "admin/system/code/detail/write";
    	} else {    		
    		return "redirect:/lostSession.do";   		
    	} 	
    }
    
    @RequestMapping(value="/admin/system/detail/retrieveDetailCodeWrite.do")
    public String retrieveDetailCodeWrite(Code input, ModelMap model, HttpSession session){

		input.setUserId((String) session.getAttribute("userId"));

		codeService.insertDetailCode(input);

        return "redirect:/admin/system/detailCodeList.do";
    }

    @RequestMapping(value="/admin/system/detailCodeDetail.do")
    public String retrieveDetailCodeDetail(Code input, ModelMap model, HttpSession session){
		String loginChk = (String) session.getAttribute("userId");
		    	
    	if (loginChk != null) { 

	    	List<Code> groupCodeList = codeService.retrieveGroupList();
	    	Code result = codeService.retrieveDetailCodeDetail(input);    	
	
	        model.addAttribute("groupCodeList", groupCodeList);
	        model.addAttribute("result", result);
	
	        return "admin/system/code/detail/update";
    	} else {    		
    		return "redirect:/lostSession.do";   		
    	} 	
    }
    
	@RequestMapping(value="/admin/system/detail/retrieveDetailCodeUpdate.do")
    public String retrieveDetailCodeUpdate(Code input, ModelMap model, HttpSession session){

		input.setUserId((String) session.getAttribute("userId"));

		codeService.updateDetailCode(input);
    	
        return "redirect:/admin/system/detailCodeList.do";
    }
	
}