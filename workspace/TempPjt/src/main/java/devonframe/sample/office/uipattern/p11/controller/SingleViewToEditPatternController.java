/*
 * @(#) CodeController.java
 *
 * Copyright 2012 by LG CNS, Inc.,
 * All rights reserved.
 *
 * Do Not Erase This Comment!!! (이 주석문을 지우지 말것)
 *
 * 본 클래스를 실제 프로젝트에 사용하는 경우 XXXX 프로젝트 담당자에게
 * 프로젝트 정식명칭, 담당자 연락처(Email)등을 mail로 알려야 한다.
 *
 * 소스를 변경하여 사용하는 경우 XXXX 프로젝트 담당자에게
 * 변경된 소스 전체와 변경된 사항을 알려야 한다.
 * 저작자는 제공된 소스가 유용하다고 판단되는 경우 해당 사항을 반영할 수 있다.
 *
 * (주의!) 원저자의 허락없이 재배포 할 수 없으며
 * LG CNS 외부로의 유출을 하여서는 안 된다.
 */
package devonframe.sample.office.uipattern.p11.controller;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.message.saymessage.SayMessage;
import devonframe.sample.office.common.code.model.Code;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.uipattern.employee.model.Employee;
import devonframe.sample.office.uipattern.employee.service.EmployeeService;

/**
 * <pre>
 * 본 클래스는 코드 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class SingleViewToEditPatternController {

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;


    @RequestMapping(value="/pattern/p11/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model){

    	if (searchNum!=null) {
            Employee input = new Employee();
            input.setNum(searchNum);

            Employee employee = employeeService.retrieveEmployee(input);
            if (employee==null) {
            	SayMessage.setMessageCode("dev.inf.com.nodata");
            }
            model.addAttribute("result", employee);
    	}

        return "pattern/p11/employeeDetail";
    }

    @RequestMapping(value="/pattern/p11/retrieveEmployeeForm.do")
    public String retrieveEmployeeForm(String searchNum, String mode, ModelMap model){

        if("update".equals(mode)) {
            Employee input = new Employee();
            input.setNum(searchNum);

            Employee employee = employeeService.retrieveEmployee(input);
            if(employee == null) {
                employee = new Employee();
            }

            model.addAttribute("result", employee);

            Code code = new Code();
            code.setCodeGroup(employee.getDivisionCode());

            model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        }else{
            model.addAttribute("result", new Employee());
        }

        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/p11/employeeForm";
    }

    @RequestMapping(value="/pattern/p11/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/pattern/p11/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/p11/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/pattern/p11/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/p11/deleteEmployee.do")
    public String deleteEmployee(Employee input){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/p11/retrieveEmployee.do";
    }

}
