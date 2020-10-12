/*
 * @(#) EmployeeController.java
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
package devonframe.sample.office.function.resultHandler.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import devonframe.sample.office.common.code.service.CodeService;
import devonframe.sample.office.function.resultHandler.service.ResultHandlerService;
import devonframe.sample.office.uipattern.employee.model.Employee;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class ResultHandlerController {

	@Resource(name = "resultHandlerService")
	private ResultHandlerService resultHandlerService;

	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "/function/resultHandler/retrieveEmployeeListForm.do")
	public String retrieveEmployeeListForm(ModelMap model) {
		Employee input = new Employee();
		
		model.addAttribute("input", input);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());
		return "function/resultHandler/employeeList";
	}

	@RequestMapping(value = "/function/resultHandler/retrieveEmployeeListWithJson.do")
	public void retrieveEmployeeListWithJson(Employee input, ModelMap model, HttpServletResponse response) {
		resultHandlerService.retrieveEmployeeListWithJson(input, response);	
		 
	}
	
	@RequestMapping(value = "/function/resultHandler/retrieveEmployeeListWithExcel.do")
	public void retrieveEmployeeListWithExcel(Employee input, ModelMap model, HttpServletResponse response) {
		resultHandlerService.retrieveEmployeeListWithExcel(input, response);	
		 
	}

}
