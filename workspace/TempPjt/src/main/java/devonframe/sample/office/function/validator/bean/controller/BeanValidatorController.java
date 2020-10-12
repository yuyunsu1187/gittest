package devonframe.sample.office.function.validator.bean.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.message.saymessage.SayMessage;
import devonframe.sample.office.common.code.model.Code;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.function.validator.bean.model.Employee;
import devonframe.sample.office.function.validator.bean.service.EmployeeService;

@Controller
public class BeanValidatorController {
    
    @Resource(name = "employeeServiceForBeanValidator")
    private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name="beanValidator")
    private Validator validator;
    
    @InitBinder
    protected void initBinder(WebDataBinder binder){
     binder.setValidator(this.validator);
    }
    
    @RequestMapping(value = "/function/validator/bean/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "function/validator/bean/employeeForm";
    }
    
    @RequestMapping(value = "/function/validator/bean/insertEmployee.do")
    public String insertEmployee(Employee employee, BindingResult bindingResult, ModelMap model) {
       
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
        return "function/validator/bean/employeeForm";
    }
    
    @RequestMapping(value = "/function/validator/bean/insertEmployeeAnnotation.do")
    public String insertEmployeeAnnotation(@Valid Employee employee, BindingResult bindingResult, ModelMap model) {
       
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
        return "function/validator/bean/employeeForm";
    }
}
