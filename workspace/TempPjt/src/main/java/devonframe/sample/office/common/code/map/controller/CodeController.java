package devonframe.sample.office.common.code.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import devonframe.sample.office.common.code.map.service.CodeService;



/**
 * <pre>
 * 본 클래스는 코드 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller("codeControllerForMap")
public class CodeController {

    @Resource(name = "codeServiceForMap")
    private CodeService codeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    @RequestMapping(value = "/common/code/map/retrievedepartmentCodeList.do")
    public String retrieveDepartmentCodeList(@RequestParam HashMap<String, Object> input, ModelMap model) {

        List<Map<String,Object>> departmentCodeList = codeService.retrieveDepartmentCodeList(input);

        model.addAttribute("resultList", departmentCodeList);

        return "ajaxView";
    }
}
