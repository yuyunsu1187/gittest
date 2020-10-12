package devonframe.sample.office.function.validator.bean.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.sample.office.function.validator.bean.model.Employee;


@Service(value="employeeServiceForBeanValidator")
public class EmployeeServiceImpl implements EmployeeService {
    
    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public Employee retrieveEmployee(Employee employee) {
        return commonDao.select("EmployeeForBeanValidator.retrieveEmployee", employee);
    }    

    public void insertEmployee(Employee employee) {
        commonDao.insert("EmployeeForBeanValidator.insertEmployee", employee);        
    }

    public void updateEmployee(Employee employee) {
        commonDao.insert("EmployeeForBeanValidator.updateEmployee", employee);        
    }

    public void deleteEmployee(Employee employee) {
        commonDao.insert("EmployeeForBeanValidator.deleteEmployee", employee);        
    }

}
