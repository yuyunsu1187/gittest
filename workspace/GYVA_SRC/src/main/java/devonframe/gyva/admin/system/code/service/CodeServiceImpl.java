/*
 * @(#) CodeServiceImpl.java
 *
 * Copyright 2012 by LG CNS, Inc.,
 * All rights reserved.
 *
 * Do Not Erase This Comment!!! (이 주석문을 지우지 말것)
 *
 * 본 클래스를 실제 프로젝트에 사용하는 경우 이브아르 아카데미 프로젝트 담당자에게
 * 프로젝트 정식명칭, 담당자 연락처(Email)등을 mail로 알려야 한다.
 *
 * 소스를 변경하여 사용하는 경우 이브아르 아카데미 프로젝트 담당자에게
 * 변경된 소스 전체와 변경된 사항을 알려야 한다.
 * 저작자는 제공된 소스가 유용하다고 판단되는 경우 해당 사항을 반영할 수 있다.
 *
 * (주의!) 원저자의 허락없이 재배포 할 수 없으며
 * LG CNS 외부로의 유출을 하여서는 안 된다.
 */
package devonframe.gyva.admin.system.code.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.admin.system.code.model.Code;


/**
 * <pre>
 * 본 클래스는 코드 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("codeService")
public class CodeServiceImpl implements CodeService {

	@Resource(name="commonDao")
	private CommonDao commonDao;

	public List<Code> retrieveCodeList(Code code) {
        return commonDao.selectList("Code.retrieveCodeList", code);
    }

    public List<Code> retrieveGroupList() {
    	return commonDao.selectList("Code.retrieveGroupList");
    }    

    public List<Code> retrieveSurveyList() {
    	return commonDao.selectList("Code.retrieveSurveyList");
    }

    public List<Code> retrieveL1MenuList() {
    	return commonDao.selectList("Code.retrieveL1MenuList");
    }

    public List<Code> retrieveL2MenuList(Code code) {
    	return commonDao.selectList("Code.retrieveL2MenuList", code);
    }

    public List<Code> retrieveGroupCodeList() {
    	List<Code> resultList = commonDao.selectList("Code.retrieveGroupCodeList");
        return resultList;
    	
    };
    public Code retrieveGroupCodeDetail(Code code) {
    	Code result = commonDao.select("Code.retrieveGroupCodeDetail", code);
        return result;
    	
    };
    public void insertGroupCode(Code code) {
    	commonDao.insert("Code.insertGroupCode", code);
    };
    public void updateGroupCode(Code code) {
    	commonDao.update("Code.updateGroupCode", code);
    };

    public List<Code> retrieveDetailCodeList() {
    	List<Code> resultList = commonDao.selectList("Code.retrieveDetailCodeList");
        return resultList;
    	
    };
    public Code retrieveDetailCodeDetail(Code code) {
    	Code result = commonDao.select("Code.retrieveDetailCodeDetail", code);
        return result;
        
    };
    public List<Code> retrieveUserTypeList(Code code) {
    	List<Code> resultList = commonDao.selectList("Code.retrieveUserTypeList", code);
        return resultList;
        
    };
    public List<Code> retrieveManagerTypeList(Code code) {
    	List<Code> resultList = commonDao.selectList("Code.retrieveManagerTypeList", code);
        return resultList;
        
    };
    public void insertDetailCode(Code code) {
    	commonDao.insert("Code.insertDetailCode", code);
    };
    public void updateDetailCode(Code code) {
    	commonDao.update("Code.updateDetailCode", code);
    };
    
}
