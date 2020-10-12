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

import org.springframework.batch.item.ItemProcessor;

import devonframe.batch.sample.common.model.Employee;


/**
 * Composite 테스트용 Sample Processor
 *
 * @author DevOn Framework, LG CNS,Inc., devon@lgcns.com
 * @version DevOnFrame 1.0.0
 * @since DevOnFrame 1.0.0
 */
public class CompositeEmployeeProcessor implements ItemProcessor<Object[], Employee>{

    /**
     * Composite Reader 로부터 넘겨받은 item array 를 처리하는 메소드
     * 
     * @param item
     * @return 
     * @throws Exception
     * @see org.springframework.batch.item.ItemProcessor#process(java.lang.Object)
     */
    public Employee process(Object[] item) throws Exception {
        
        //emp1 는 num 정보만 있는 file 에서 read 한 item.
        Employee emp1 = (Employee)item[0];
        
        //emp2 는 num 정보를 제외한 정보만 들어있는 file 에서 read 한 item
        Employee emp2 = (Employee)item[1];
        
        // emp1 에서 num 정보를 가져와 emp2 에 set
        emp2.setNum(emp1.getNum());
        
        return emp2;
    }

}
