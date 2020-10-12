package devonframe.sample.office.uipattern.mp31.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.sample.office.common.code.map.service.CodeService;
import devonframe.sample.office.uipattern.employee.map.model.EmployeeMap;
import devonframe.sample.office.uipattern.employee.map.service.EmployeeService;

@Controller("listToDetailPatternForMapController")
public class ListToDetailPatternController {

    @Resource(name = "codeServiceForMap")
    private CodeService codeService;

    @Resource(name = "employeeServiceForMap")
    private EmployeeService employeeService;

    @RequestMapping(value="/pattern/mp31/retrieveEmployee.do")
    public String retrieveEmployee(@RequestParam Map<String, Object> input, ModelMap model){
        
    	Map<String, Object> employee = employeeService.retrieveEmployee(input);
        
        if(employee == null) {
            employee = new HashMap<String,Object>();
            model.addAttribute("mode", "insert");
        }else{
            model.addAttribute("mode", "update");
        }
        
        model.addAttribute("result", employee);

        return "pattern/mp31/employeeDetail";
    }
    
    @RequestMapping(value="/pattern/mp31/retrieveEmployeeForm.do")
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

        return "pattern/mp31/employeeForm";
    }

    @RequestMapping(value="/pattern/mp31/retrieveEmployeeList.do")
    public String retrieveEmployeeList(@RequestParam Map<String, Object> input, ModelMap model){

        List<Map<String, Object>> resultList = employeeService.retrieveEmployeeList(input);

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());

        return "pattern/mp31/employeeList";
    }
    

    @RequestMapping(value="/pattern/mp31/insertEmployee.do")
    public String insertEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("num", input.get("num"));
        return "redirect:/pattern/mp31/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/mp31/updateEmployee.do")
    public String updateEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("num", input.get("num"));
        return "redirect:/pattern/mp31/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/mp31/deleteEmployee.do")
    public String deleteEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/mp31/retrieveEmployeeList.do";
    }
    
}
