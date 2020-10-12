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
package devonframe.batch.sample.composite;

import devonframe.batch.item.composite.mapping.CompositeItemMapper;
import devonframe.batch.sample.common.model.Employee;

/**
 * 샘플용 Custom CompositeItemMapper
 *
 * @author DevOn Framework, LG CNS,Inc., devon@lgcns.com
 * @version DevOnFrame 1.0.0
 * @since DevOnFrame 1.0.0
 */
public class CustomCompositeItemMapper implements CompositeItemMapper<Employee>{

    /**
     * 입력 받은 Object Array 를 이용하여 VO 에 매핑하는 Custom Mapper 의 예.
     * 원하는 형태의 VO 로 만들어서 Processor 또는 Writer 에 전달한다.
     * 
     * @param items
     * @return Test 용 VO 객체
     * @throws Exception
     * @see devonframe.batch.item.composite.mapping.CompositeItemMapper#mapItems(java.lang.Object[])
     */
    public Employee mapItems(Object[] items) throws Exception {
        
    	Employee employee = new Employee();
        
    	// Composite Reader를 통해 읽어들인 Item을 하나로 조합함.
    	if(items[0] != null) {
	    	employee.setNum(((Employee)items[0]).getNum());
    	} else {
    		return null;
    	}

    	if(items[1] != null) {
	    	employee.setName(((Employee)items[1]).getName());
	    	employee.setSex(((Employee)items[1]).getSex());
	    	employee.setDepartmentCode(((Employee)items[1]).getDepartmentCode());
	    	employee.setJoblevelCode(((Employee)items[1]).getJoblevelCode());
	    	employee.setSkillCode(((Employee)items[1]).getSkillCode());
	    	employee.setTelephone(((Employee)items[1]).getTelephone());
	    	employee.setBirthdate(((Employee)items[1]).getBirthdate());
	    	employee.setPostal(((Employee)items[1]).getPostal());
	    	employee.setAddress(((Employee)items[1]).getAddress());
    	} else {
    		return null;
    	}

        return employee;
    }

}
