package devonframe.sample.office.function.resultHandler.service;


import javax.servlet.http.HttpServletResponse;

import devonframe.sample.office.uipattern.employee.model.Employee;

public interface ResultHandlerService {
	public void retrieveEmployeeListWithJson(Employee employee, HttpServletResponse response);
	public void retrieveEmployeeListWithExcel(Employee employee, HttpServletResponse response);
}
