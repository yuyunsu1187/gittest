package devonframe.sample.office.uipattern.mp2.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.sample.office.common.code.map.service.CodeService;
import devonframe.sample.office.uipattern.employee.map.service.EmployeeService;

@Controller("multiEditPatternForMapController")
public class MultiEditPatternController {
    
    @Resource(name = "employeeServiceForMap")
    private EmployeeService employeeService;

   @Resource(name = "codeServiceForMap")
    private CodeService codeService;

    @RequestMapping(value="/pattern/mp2/retrieveEmployeeList.do")
    public String retrieveEmployeeList(@RequestParam Map<String, Object> input, ModelMap model){

        List<Map<String, Object>> resultList = employeeService.retrieveEmployeeList(input);
        List<Map<String, Object>> joblevelCodeList = codeService.retrieveJobLevelCodeList();
        List<Map<String, Object>> skillCodeList = codeService.retrieveSkillCodeList();

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", joblevelCodeList);
        model.addAttribute("skillCodeList", skillCodeList);

        return "pattern/mp2/employeeList";
    }

    @RequestMapping(value="/pattern/mp2/saveEmployeeList.do")
    public String saveEmployee(List<Map<String, Object>> employees, String searchJoblevelCode, String searchSkillCode, RedirectAttributes redirectAttributes){

        employeeService.saveEmployee(employees);

        redirectAttributes.addAttribute("joblevelCode", searchJoblevelCode);
        redirectAttributes.addAttribute("skillCode", searchSkillCode);

        return "redirect:/pattern/mp2/retrieveEmployeeList.do";
    }
}
