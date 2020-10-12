package devonframe.sample.office.uipattern.mp32.controller;

import java.util.HashMap;
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

@Controller("ListToEditPatternForMapController")
public class ListToEditPatternController {
    
    @Resource(name = "employeeServiceForMap")
    private EmployeeService employeeService;

    @Resource(name = "codeServiceForMap")
    private CodeService codeService;

    @RequestMapping(value="/pattern/mp32/retrieveEmployeeList.do")
    public String retrieveEmployeeList(@RequestParam Map<String, Object> input, ModelMap model){

        List<Map<String, Object>> resultList = employeeService.retrieveEmployeeList(input);

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());

        return "pattern/mp32/employeeList";
    }

    @RequestMapping(value="/pattern/mp32/retrieveEmployeeForm.do")
    public String retrieveEmployeeForm(@RequestParam Map<String, Object> input, String mode, ModelMap model){

        Map<String, Object> employee = null;

        if("update".equals(mode)) {

            employee = employeeService.retrieveEmployee(input);
            if(employee == null) {
                employee = new HashMap<String, Object>();
            }
            Map<String, Object> code = new HashMap<String, Object>();
            code.put("codeGroup", employee.get("divisionCode"));
            model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        }else{
            employee = new HashMap<String, Object>();
        }
        
        model.addAttribute("input",input);
        model.addAttribute("result",employee);
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/mp32/employeeForm";
    }

    @RequestMapping(value="/pattern/mp32/insertEmployee.do")
    public String insertEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        return "redirect:/pattern/mp32/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/mp32/updateEmployee.do")
    public String updateEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        return "redirect:/pattern/mp32/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/mp32/deleteEmployee.do")
    public String deleteEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/mp32/retrieveEmployeeList.do";
    }

}
