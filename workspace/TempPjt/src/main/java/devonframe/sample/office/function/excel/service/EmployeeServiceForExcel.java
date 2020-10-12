package devonframe.sample.office.function.excel.service;

import java.util.List;

import devonframe.sample.office.function.excel.model.EmployeeForExcel;


public interface EmployeeServiceForExcel {
    
    public List<EmployeeForExcel> retrieveEmployeeList(EmployeeForExcel employee);
    
    public void insertEmployee(EmployeeForExcel employee);

}
