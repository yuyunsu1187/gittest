package devonframe.gyva.front.common.code.map.service;

import java.util.List;
import java.util.Map;


public interface CodeService {

    public List<Map<String,Object>> retrieveCategoryCodeList(Map<String, Object> codeGroup);
    
    public List<Map<String,Object>> retrieveSkillCodeList();
    public List<Map<String,Object>> retrieveJobLevelCodeList();
    public List<Map<String,Object>> retrieveDivisionCodeList();
    public List<Map<String,Object>> retrieveDepartmentCodeList();
    public List<Map<String,Object>> retrieveDepartmentCodeList(Map<String,Object> codeGroup);
    public List<Map<String,Object>> retrieveCodeList(String string);
    
    public Map<String,Object> retrieveSkillCodeMap();
    public Map<String,Object> retrieveJobLevelCodeMap();
    public Map<String,Object> retrieveDivisionCodeMap();
    public Map<String,Object> retrieveDepartmentCodeMap();
    public Map<String,Object> retrieveDepartmentCodeMap(Map<String,Object> codeGroup);
}
