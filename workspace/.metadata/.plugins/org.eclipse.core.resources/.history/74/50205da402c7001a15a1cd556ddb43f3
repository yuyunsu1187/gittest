/*
 * @(#) EmployeeServiceImpl.java
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
package devonframe.sample.office.uipattern.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.sample.office.uipattern.common.model.EmployeeDetail;
import devonframe.sample.office.uipattern.employee.model.Employee;
import devonframe.sample.office.uipattern.employee.model.EmployeeArray;
import devonframe.sample.office.uipattern.employee.model.PagingEmployee;
import devonframe.sample.office.uipattern.employee.model.ScrollPagingEmployee;
import devonframe.sample.office.uipattern.px1.model.ShuttleEmployeeArray;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public Employee retrieveEmployee(Employee employee) {
        return commonDao.select("Employee.retrieveEmployee", employee);
    }

    public List<Employee> retrieveEmployeeList(Employee employee) {
        List<Employee> resultList = commonDao.selectList("Employee.retrieveEmployeeList", employee);
        return resultList;
    }

    public List<Employee> retrieveEmployeePagedList(PagingEmployee employee) {
        List<Employee> resultList = commonDao.selectPagedList("Employee.retrieveEmployeeList", employee);
        return resultList;
    }
    
    public List<Employee> retrieveEmployeeScrollPagedList(ScrollPagingEmployee employee) {
        List<Employee> resultList = commonDao.selectScrollPagedList("Employee.retrieveEmployeeScrollPagingList", employee, true);
        return resultList;
    }

    public List<Employee> retrieveShuttleEmployeeList(Employee employee) {
        List<Employee> resultList = commonDao.selectList("Employee.retrieveShuttleEmployeeList", employee);
        return resultList;
    }

    public List<Employee> retrieveEmployeeTreeList(Employee employee) {

        List<Employee> resultList = commonDao.selectList("Employee.retrieveEmployeeTreeList", employee);

        return resultList;
    }

    public void insertEmployee(Employee employee) {
        commonDao.insert("Employee.insertEmployee", employee);
    }

    public void updateEmployee(Employee employee) {
        commonDao.update("Employee.updateEmployee", employee);
    }

    public void updateEmployeeForP2(Employee employee) {
        commonDao.update("Employee.updateEmployeeForP2", employee);
    }

    public void deleteEmployee(Employee employee) {
        commonDao.delete("Employee.deleteEmployee", employee);
    }

	public void saveEmployee(EmployeeArray employees) {

		List<Employee> employeeList = employees.getEmployeeList();

        for (int i = 0; i < employees.size(); i++) {
        	Employee employee = employeeList.get(i);
            String actType = employee.getActType();

            if(actType.equals("C")) {
                insertEmployee(employee);

            }else if(actType.equals("U")) {
                updateEmployeeForP2(employee);

            }else if(actType.equals("D")) {
                deleteEmployee(employee);
            }
        }
	}
    public void saveShuttleEmployeeList(ShuttleEmployeeArray shuttleEmployeeList) {
        for(Employee employee:shuttleEmployeeList.getEmployeeList() ) {
            commonDao.insert("Employee.insertShuttleEmployee", employee);
        }
        for(Employee employee:shuttleEmployeeList.getEmployeeList() ) {
            commonDao.delete("Employee.deleteShuttleEmployee", employee);
        }
    }

    public EmployeeDetail retrieveEmployeeDetail(EmployeeDetail employeeDetail) {
        EmployeeDetail resultDetail = commonDao.select("Employee.retrieveEmployeeDetail", employeeDetail);
        return resultDetail;
    }

    public void insertEmployeeDetail(EmployeeDetail employeeDetail) {
        commonDao.insert("Employee.insertEmployeeDetail", employeeDetail);
    }

    public void updateEmployeeDetail(EmployeeDetail employeeDetail) {
        commonDao.update("Employee.updateEmployeeDetail", employeeDetail);
    }

    public void deleteEmployeeDetail(EmployeeDetail employeeDetail) {
        commonDao.delete("Employee.deleteEmployeeDetail", employeeDetail);
    }

    public void updateEmployeeForP41(Employee employee) {
        commonDao.update("Employee.updateEmployeeForP41", employee);
    }
}