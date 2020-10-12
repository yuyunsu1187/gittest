package devonframe.sample.office.uipattern.px1.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.uipattern.employee.model.Employee;
import devonframe.sample.office.uipattern.employee.service.EmployeeService;
import devonframe.sample.office.uipattern.px1.model.ShuttleEmployeeArray;

@Controller
public class ShuttleEditPatternController {

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "employeeService")
    private EmployeeService employeeService;


    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;
    
    @RequestMapping(value="/pattern/px1/retrieveShuttleEmployeeList.do")
    public String retrieveShuttleEmployeeList(Employee input, ModelMap model) {

        input.setType("current");
        List<Employee> resultList = employeeService.retrieveShuttleEmployeeList(input);
        input.setType("dlt");
        List<Employee> resultListDlt = employeeService.retrieveShuttleEmployeeList(input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("resultListDlt", resultListDlt);
        

        model.addAttribute("input", input);
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());

        return "pattern/px1/employeeList";
    }
    
    @RequestMapping(value="/pattern/px1/saveShuttleEmployeeList.do")
    public String saveShuttleEmployeeList(String searchSkillCode, String searchJoblevelCode,String searchName, ShuttleEmployeeArray shuttleEmployeeList, RedirectAttributes redirectAttributes) {

        employeeService.saveShuttleEmployeeList(shuttleEmployeeList);
        
        redirectAttributes.addAttribute("joblevelCode", searchJoblevelCode);
        redirectAttributes.addAttribute("skillCode", searchSkillCode);
        redirectAttributes.addAttribute("name", searchName);
        
        return "redirect:/pattern/px1/retrieveShuttleEmployeeList.do";
    }
}
