package devonframe.sample.office.common.code.map.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;

@Service("codeServiceForMap")
public class CodeServiceImpl implements CodeService{

    @Resource(name="commonDaoForMap")
    private CommonDao commonDao;
    
    public List<Map<String, Object>> retrieveSkillCodeList() {
        return commonDao.selectList("Code.retrieveSkillCodeList");
    }
    
    public List<Map<String, Object>> retrieveJobLevelCodeList() {
        return commonDao.selectList("Code.retrieveJobLevelCodeList");
    }

    public List<Map<String, Object>> retrieveDivisionCodeList() {
        return commonDao.selectList("Code.retrieveDivisionCodeList");
    }

    public List<Map<String, Object>> retrieveDepartmentCodeList() {
        return commonDao.selectList("Code.retrieveDepartmentCodeList");
    }

    public List<Map<String, Object>> retrieveDepartmentCodeList(Map<String, Object> codeGroup) {
        return commonDao.selectList("Code.retrieveDepartmentCodeList", codeGroup);
    }

    public List<Map<String, Object>> retrieveCodeList(String string) {
        return commonDao.selectList("Code.retrieveCodeList",string);
    }

    public Map<String, Object> retrieveSkillCodeMap() {
        List<Map<String, Object>> codeList = commonDao.selectList("Code.retrieveSkillCodeList");
        Map<String, Object> codeMap = convertListToMap(codeList);
        return codeMap;
    }

    public Map<String, Object> retrieveJobLevelCodeMap() {
        List<Map<String, Object>> codeList = commonDao.selectList("Code.retrieveJobLevelCodeList");
        Map<String, Object> codeMap = convertListToMap(codeList);
        return codeMap;
    }

    public Map<String, Object> retrieveDivisionCodeMap() {
        List<Map<String, Object>> codeList = commonDao.selectList("Code.retrieveDivisionCodeList");
        Map<String, Object> codeMap = convertListToMap(codeList);
        return codeMap;
    }

    public Map<String, Object> retrieveDepartmentCodeMap() {
        List<Map<String, Object>> codeList = commonDao.selectList("Code.retrieveDepartmentCodeList");
        Map<String, Object> codeMap = convertListToMap(codeList);
        return codeMap;
    }
    
    public Map<String, Object> retrieveDepartmentCodeMap(Map<String, Object> codeGroup) {
        List<Map<String, Object>> codeList = commonDao.selectList("Code.retrieveDepartmentCodeList", codeGroup);
        Map<String, Object> codeMap = convertListToMap(codeList);
        return codeMap;
    }

    private Map<String, Object> convertListToMap(List<Map<String, Object>> codeList) {
        Map<String, Object> codeMap = new HashMap<String, Object>();
        for(Map<String, Object> map : codeList) {
            codeMap.put((String)map.get("code"), map.get("value"));
        }
        return codeMap;
    }
}
