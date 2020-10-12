package devonframe.sample.office.uipattern.p34.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.sample.office.common.code.model.Code;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.uipattern.employee.model.Employee;
import devonframe.sample.office.uipattern.employee.service.EmployeeService;

@Controller
public class ListDetailEditPatternController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value = "/pattern/p34/retrieveEmployeeList.do")
    public String retrieveEmployeeList(Employee input, ModelMap model) {
        
        
        model.addAttribute("input", input);
        model.addAttribute("result", new Employee());
        model.addAttribute("resultList", employeeService.retrieveEmployeeList(input));
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "pattern/p34/employeeListDetail";
    }

    @RequestMapping(value = "/pattern/p34/updateEmployee.do")
    public String updateEmployee(Employee input, String searchSkillCode, String searchJoblevelCode, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("mode", "update");
        redirectAttributes.addAttribute("num", input.getNum());
        redirectAttributes.addAttribute("skillCode", searchSkillCode);
        redirectAttributes.addAttribute("joblevelCode", searchJoblevelCode);
        return "redirect:/pattern/p34/retrieveEmployeeList.do";
    }

    @RequestMapping(value = "/pattern/p34/deleteEmployee.do")
    public String deleteEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.deleteEmployee(input);
        redirectAttributes.addAttribute("skillCode", input.getSkillCode());
        redirectAttributes.addAttribute("joblevelCode", input.getJoblevelCode());
        return "redirect:/pattern/p34/retrieveEmployeeList.do";
    }

    @RequestMapping(value = "/pattern/p34/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("mode", "update");
        redirectAttributes.addAttribute("num", input.getNum());
        redirectAttributes.addAttribute("skillCode", input.getSkillCode());
        redirectAttributes.addAttribute("joblevelCode", input.getJoblevelCode());
        return "redirect:/pattern/p34/retrieveEmployeeList.do";
    }


    @RequestMapping(value = "/pattern/p34/retrieveEmployeeDetail.do")
    public String retrieveEmployeeDetail(Employee input, ModelMap model) {
        Employee employee = employeeService.retrieveEmployee(input);
        Code codeGroup = new Code();
        codeGroup.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("mode", "update");
        model.addAttribute("result", employee);
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(codeGroup));
        return "ajaxView";
    }

}
