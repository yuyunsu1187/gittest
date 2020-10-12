package devonframe.sample.office.uipattern.p41.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.sample.office.common.code.model.Code;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.uipattern.common.model.EmployeeDetail;
import devonframe.sample.office.uipattern.employee.model.Employee;
import devonframe.sample.office.uipattern.employee.service.EmployeeService;

@Controller
public class MasterDetailPatternController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value = "/pattern/p41/employeeDetail.do")
    public String employeeDetail(ModelMap model) {
        model.addAttribute("result", new Employee());
        return "pattern/p41/employeeDetail";
    }

    @RequestMapping(value = "/pattern/p41/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {
        Employee input = new Employee();
        input.setNum(searchNum);
        Employee result = employeeService.retrieveEmployee(input);

        EmployeeDetail employeeDetail = new EmployeeDetail();
        employeeDetail.setNum(searchNum);
        EmployeeDetail resultDetail = employeeService.retrieveEmployeeDetail(employeeDetail);

        model.addAttribute("result", result);
        model.addAttribute("resultDetail", resultDetail);
        return "pattern/p41/employeeDetail";
    }

    @RequestMapping(value = "/pattern/p41/insertEmployeeDetail.do")
    public String insertEmployeeDetail(Employee input, EmployeeDetail employeeDetail, ModelMap model) {
        employeeService.insertEmployeeDetail(employeeDetail);
        model.addAttribute("resultDetail", employeeDetail);
        model.addAttribute("result", input);
        return "pattern/p41/employeeDetail";
    }

    @RequestMapping(value = "/pattern/p41/updateEmployeeDetail.do")
    public String updateEmployeeDetail(Employee input, EmployeeDetail employeeDetail, ModelMap model) {
        employeeService.updateEmployeeDetail(employeeDetail);
        model.addAttribute("result", input);
        model.addAttribute("resultDetail", employeeDetail);
        return "pattern/p41/employeeDetail";
    }

    @RequestMapping(value = "/pattern/p41/deleteEmployeeDetail.do")
    public String deleteEmployeeDetail(Employee input, EmployeeDetail employeeDetail, ModelMap model) {
        employeeService.deleteEmployeeDetail(employeeDetail);
        model.addAttribute("result", input);
        return "pattern/p41/employeeDetail";
    }


    @RequestMapping(value = "/pattern/p41/employeeFormPopup.do")
    public String employeeFormPopup(Employee input, ModelMap model) {
        Employee employee = employeeService.retrieveEmployee(input);
        Code codeGroup = new Code();
        codeGroup.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("result", employee);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(codeGroup));
        return "pattern/p41/employeeFormPopup";
    }

    @RequestMapping(value = "/pattern/p41/updateEmployee.do")
    public String updateEmployee(Employee input, ModelMap model) {
        employeeService.updateEmployeeForP41(input);
        model.addAttribute("mode", "complete");
        model.addAttribute("result", input);
        return "pattern/p41/employeeFormPopup";
    }

}
