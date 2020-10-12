package devonframe.sample.office.uipattern.pp3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.sample.office.common.code.model.Code;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.uipattern.employee.model.Employee;
import devonframe.sample.office.uipattern.employee.model.ScrollPagingEmployee;
import devonframe.sample.office.uipattern.employee.service.EmployeeService;
import devonframe.scrollpaging.model.ScrollPagingList;
import devonframe.util.NullUtil;

@Controller("listToEditPatternForScrollPagingController")
public class ListToEditPatternController {

    @Resource(name = "employeeService")
    private EmployeeService employeeService;
    
    @Resource(name = "codeService")
    private CodeService codeService;
    
    @RequestMapping(value="/pattern/pp3/retrieveEmployeeList.do")
    public String retrieveEmployeeList(ScrollPagingEmployee input, ModelMap model){

    	//초기 키값 입력
		if(NullUtil.isNone(input.getPageConditionKey())){
			input.setPageConditionKey("num|name");
		}
    	List<Employee> resultList = employeeService.retrieveEmployeeScrollPagedList(input);
        model.addAttribute("resultList", resultList);
        
        return "pattern/pp3/employeeList";
    }
    
    @RequestMapping(value="/pattern/pp3/retrieveEmployeeListAjax.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> retrieveEmployeeListAjax(ScrollPagingEmployee input, ModelMap model){

		ScrollPagingList resultList = (ScrollPagingList) employeeService.retrieveEmployeeScrollPagedList(input);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", resultList);
		map.put("pageCount", resultList.getPageCount());
		map.put("pageNextYn", resultList.getPageNextYn());
		map.put("pageConditionKey", resultList.getPageConditionKey());
		map.put("pageTotalCount", resultList.getPageTotalCount());

		return map;
	}
    
    @RequestMapping(value="/pattern/pp3/retrieveEmployeeForm.do")
    public String retrieveEmployeeForm(Employee input, String mode, ModelMap model){
        Employee employee = null;

        if("update".equals(mode)) {

            employee = employeeService.retrieveEmployee(input);
            if(employee == null) {
                employee = new Employee();
            }
            Code code = new Code();
            code.setCodeGroup(employee.getDivisionCode());

            model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        }else{
            employee = new Employee();
        }
        model.addAttribute("input",input);
        model.addAttribute("result",employee);

        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/pp3/employeeForm";
    }

    @RequestMapping(value="/pattern/pp3/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        return "redirect:/pattern/pp3/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/pp3/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        return "redirect:/pattern/pp3/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/pp3/deleteEmployee.do")
    public String deleteEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/pp3/retrieveEmployeeList.do";
    }
}
