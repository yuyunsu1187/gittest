package devonframe.sample.office.function.validator.bean.service;

import devonframe.sample.office.function.validator.bean.model.Employee;


public interface EmployeeService {
    
    public Employee retrieveEmployee(Employee employee);
    
    public void insertEmployee(Employee employee);

    public void updateEmployee(Employee employee);

    public void deleteEmployee(Employee employee);
}
