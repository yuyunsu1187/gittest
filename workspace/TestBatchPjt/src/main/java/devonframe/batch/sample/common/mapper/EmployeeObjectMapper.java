/*
 * Copyright ⓒ LG CNS, Inc. All rights reserved.
 *
 * Do Not Erase This Comment!!! (이 주석문을 지우지 말것)
 *
 * DevOn Framework의 클래스를 실제 프로젝트에 사용하는 경우 DevOn Framework 개발담당자에게
 * 프로젝트 정식명칭, 담당자 연락처(Email)등을 mail로 알려야 한다.
 *
 * 소스를 변경하여 사용하는 경우 DevOn Framework 개발담당자에게
 * 변경된 소스 전체와 변경된 사항을 알려야 한다.
 * 저작자는 제공된 소스가 유용하다고 판단되는 경우 해당 사항을 반영할 수 있다.
 *
 * (주의!) 원저자의 허락없이 재배포 할 수 없으며 LG CNS 외부로의 유출을 하여서는 안 된다.
 */
package devonframe.batch.sample.common.mapper;

import java.util.List;

import devonframe.batch.item.file.mapping.ObjectMapper;
import devonframe.batch.sample.common.model.Employee;

public class EmployeeObjectMapper implements ObjectMapper {

    public Object mapObject(List tokens) {
        
        int index=0;
        
        Employee emp = new Employee();
        
        emp.setNum((String)tokens.get(index++));
        emp.setName((String)tokens.get(index++));
        emp.setSex((String)tokens.get(index++));
        emp.setDepartmentCode((String)tokens.get(index++));
        emp.setJoblevelCode((String)tokens.get(index++));
        emp.setSkillCode((String)tokens.get(index++));
        emp.setTelephone((String)tokens.get(index++));
        emp.setBirthdate((String)tokens.get(index++));
        emp.setPostal((String)tokens.get(index++));
        emp.setAddress((String)tokens.get(index++));

        return emp;
    }

}
