package devonframe.sample.office.uipattern.mpp2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonframe.paging.PagingUtil;
import devonframe.paging.model.PagingList;
import devonframe.paging.model.PagingMap;
import devonframe.paging.ui.PagingUI;
import devonframe.sample.office.common.code.map.service.CodeService;
import devonframe.sample.office.uipattern.employee.map.service.EmployeeService;


@Controller("listToEditPatternForMapAndAjaxPagingController")
public class ListToEditPatternController {

    @Resource(name = "employeeServiceForMap")
    private EmployeeService employeeService;
    
    @Resource(name = "codeServiceForMap")
    private CodeService codeService;
    
    @RequestMapping(value="/pattern/mpp2/retrieveEmployeeList.do")
    public String retrieveEmployeeList(PagingMap pagingMap, ModelMap model){

        List<Map<String, Object>> resultList = employeeService.retrieveEmployeePagedList(pagingMap);

        model.addAttribute("input", pagingMap.getMap());
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());
        
        return "pattern/mpp2/employeeList";
    }
    
    @RequestMapping(value="/pattern/mpp2/retrieveEmployeeListAjax.do")
    public String retrieveEmployeeListAjax(PagingMap pagingMap , ModelMap model){

        List<Map<String, Object>> resultList = employeeService.retrieveEmployeePagedList(pagingMap);

        model.addAttribute("input", pagingMap.getMap());
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());
        
        PagingUI pagingUi = PagingUtil.getUIClass((PagingList<?>)resultList, "ajax");
        
        model.addAttribute("indexFrame", pagingUi.showIndexFrame());
        model.addAttribute("countFrame", pagingUi.showCountFrame());
        model.addAttribute("pagingSortNum", pagingUi.showSortField("사원번호","num"));
        

        return "ajaxView";
    }

    @RequestMapping(value="/pattern/mpp2/retrieveEmployeeForm.do")
    public String retrieveEmployeeForm(@RequestParam Map<String, Object> input, String mode, ModelMap model){

        Map<String, Object> employee = null;

        if("update".equals(mode)) {

            employee = employeeService.retrieveEmployee(input);
            if(employee == null) {
                employee = new HashMap<String, Object>();
            }
            Map<String, Object> code = new HashMap<String, Object>();
            code.put("codeGroup", employee.get("divisionCode"));

            model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        }else{
            employee = new HashMap<String, Object>();
        }
        model.addAttribute("input",input);
        model.addAttribute("result",employee);

        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/mpp2/employeeForm";
    }

    @RequestMapping(value="/pattern/mpp2/insertEmployee.do")
    public String insertEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        return "redirect:/pattern/mpp2/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/mpp2/updateEmployee.do")
    public String updateEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        return "redirect:/pattern/mpp2/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/mpp2/deleteEmployee.do")
    public String deleteEmployee(@RequestParam Map<String, Object> input, RedirectAttributes redirectAttributes){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/mpp2/retrieveEmployeeList.do";
    }
}
