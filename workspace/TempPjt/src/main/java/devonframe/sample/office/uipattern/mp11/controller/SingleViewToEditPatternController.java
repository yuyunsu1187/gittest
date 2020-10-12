package devonframe.sample.office.uipattern.mp11.controller;

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



@Controller("singleViewToEditPatternForMapController")
public class SingleViewToEditPatternController {
    @Resource(name = "codeServiceForMap")
    private CodeService codeService;

    @Resource(name = "employeeServiceForMap")
    private EmployeeService employeeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;


    @RequestMapping(value="/pattern/mp11/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model){

        if (searchNum!=null) {
            Map<String, Object> input = new HashMap<String, Object>();
            input.put("num", searchNum);

            Map<String, Object> employee = employeeService.retrieveEmployee(input);
            if (employee==null) {
                SayMessage.setMessageCode("dev.inf.com.nodata");
            }
            model.addAttribute("result", employee);
        }

        return "pattern/mp11/employeeDetail";
    }

    @RequestMapping(value="/pattern/mp11/retrieveEmployeeForm.do")
    public String retrieveEmployeeForm(String searchNum, String mode, ModelMap model){

        if("update".equals(mode)) {
            Map<String, Object> input = new HashMap<String, Object>();
            input.put("num", searchNum);

            Map<String, Object>  employee = employeeService.retrieveEmployee(input);
            if(employee == null) {
                employee = new HashMap<String, Object> ();
            }

            model.addAttribute("result", employee);

            Map<String, Object>  code = new HashMap<String, Object> ();
            code.put("codeGroup",employee.get("divisionCode"));

            model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        }else{
            model.addAttribute("result", new HashMap<String, Object> ());
        }

        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/mp11/employeeForm";
    }

    @RequestMapping(value="/pattern/mp11/insertEmployee.do")
    public String insertEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.get("num"));
        return "redirect:/pattern/mp11/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/mp11/updateEmployee.do")
    public String updateEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.get("num"));
        return "redirect:/pattern/mp11/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/mp11/deleteEmployee.do")
    public String deleteEmployee(@RequestParam Map<String, Object> input){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/mp11/retrieveEmployee.do";
    }
}
