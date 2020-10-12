package devonframe.sample.office.uipattern.mp12.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.message.saymessage.SayMessage;
import devonframe.sample.office.common.code.map.service.CodeService;
import devonframe.sample.office.uipattern.employee.map.service.EmployeeService;


@Controller("singleEditPatternForMapController")
public class SingleEditPatternController {

    @Resource(name = "employeeServiceForMap")
    private EmployeeService employeeService;

    @Resource(name = "codeServiceForMap")
    private CodeService codeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    @RequestMapping(value = "/pattern/mp12/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("result", new HashMap<String, Object>());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Map<String, Object>>());

        return "pattern/mp12/employeeForm";
    }

    @RequestMapping(value = "/pattern/mp12/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {

    	if (searchNum!=null) {
	        Map<String, Object> input = new HashMap<String, Object>();
	        Map<String, Object> code = new HashMap<String, Object>();
	        input.put("num", searchNum);
	
	        Map<String, Object> employee = employeeService.retrieveEmployee(input);
	        if (employee == null) {
	            employee = new HashMap<String, Object>();
	            SayMessage.setMessageCode("dev.inf.com.nodata");
	        }
	
	        code.put("codeGroup", employee.get("divisionCode"));
	
	        model.addAttribute("result", employee);
	        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
	        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
	        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
	        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
    	}

        return "pattern/mp12/employeeForm";
    }

    @RequestMapping(value = "/pattern/mp12/updateEmployee.do")
    public String updateEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.get("num"));
        return "redirect:/pattern/mp12/retrieveEmployee.do";

    }

    @RequestMapping(value = "/pattern/mp12/insertEmployee.do")
    public String insertEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes) {
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.get("num"));
        return "redirect:/pattern/mp12/retrieveEmployee.do";
    }

    @RequestMapping(value = "/pattern/mp12/deleteEmployee.do")
    public String deleteEmployee(@RequestParam Map<String, Object> input) {
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/mp12/retrieveEmployee.do";
    }

}
