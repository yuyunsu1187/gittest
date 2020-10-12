package devonframe.sample.office.function.transaction.service;

import devonframe.sample.office.uipattern.employee.model.Employee;

public interface AnnotationTransactionService {

    public Employee retrieveEmployee(Employee employee);

    public void updateEmployee(Employee employee);

    public void updateEmployeeRollbackCase(Employee employee);

}
