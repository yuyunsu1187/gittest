package devonframe.sample.office.function.validator.commons.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.message.saymessage.SayMessage;
import devonframe.sample.office.common.code.model.Code;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.uipattern.employee.model.Employee;
import devonframe.sample.office.uipattern.employee.service.EmployeeService;
import devonframe.validator.commons.BeanValidator;

@Controller
public class CommonsValidatorController {
    
    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name="commonsValidator")
    private BeanValidator validator;    

    @RequestMapping(value = "/function/validator/commons/validator.do")
    public String validatorClient() {

        return "function/validator/commons/validator";
    }
    
    @RequestMapping(value = "/function/validator/commons/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "function/validator/commons/employeeForm";
    }
    
    @RequestMapping(value = "/function/validator/commons/insertEmployee.do")
    public String insertEmployee(Employee employee,  ModelMap model, BindingResult bindingResult) {
        
        validator.validate(employee, bindingResult);

        Code code = new Code();
        code.setCodeGroup(employee.getDivisionCode());
        
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        
        if(bindingResult.hasErrors()) {
            model.addAttribute("employee", employee);
            
        } else {
            employeeService.insertEmployee(employee);
            SayMessage.setMessageCode("dev.suc.com.save");
        }
        return "function/validator/commons/employeeForm";
    }
}
