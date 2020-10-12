package devonframe.sample.office.function.exception.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.sample.office.common.code.model.Code;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.function.exception.service.ExceptionService;
import devonframe.sample.office.uipattern.employee.model.Employee;

@Controller
public class ExceptionController {

    @Resource(name = "exceptionService")
    private ExceptionService exceptionService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value = "/function/exception/retrievedepartmentCodeList.do")
    public String retrievedepartmentCodeList(String type, Code input, ModelMap model) {
        exceptionService.ajaxException(type);
        return "ajaxView";
    }

    @RequestMapping(value = "/function/exception/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "function/exception/employeeForm";
    }

    @RequestMapping(value = "/function/exception/updateException.do")
    public String updateEmployee(ModelMap model) {
        exceptionService.updateException();
        return "redirect:/function/exception/employeeForm.do";

    }

    @RequestMapping(value = "/function/exception/insertException.do")
    public String insertEmployee(ModelMap model) {
        exceptionService.insertException();
        return "redirect:/function/exception/employeeForm.do";
    }

    @RequestMapping(value = "/function/exception/deleteException.do")
    public String deleteEmployee(ModelMap model) {
        exceptionService.deleteException();
        return "redirect:/function/exception/employeeForm.do";
    }
}
