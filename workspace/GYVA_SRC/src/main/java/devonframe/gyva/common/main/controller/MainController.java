package devonframe.gyva.common.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.fileupload.FileUpload;
import devonframe.gyva.admin.system.code.service.CodeService;
import devonframe.gyva.common.fileupload.service.FileUploadService;
import devonframe.gyva.common.menu.model.Menu;
import devonframe.gyva.common.menu.service.MenuService;
import devonframe.gyva.common.user.service.UserService;
import devonframe.gyva.common.util.UtilService;
import devonframe.gyva.contents.model.Contents;
import devonframe.gyva.contents.service.ContentsService;

/**
 * <pre>
 * 본 클래스는 로그인 처리를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class MainController {

	@Resource(name = "userService")
	private UserService userService;
    
    @Resource(name = "menuService")
    private MenuService menuService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
    
    @Resource(name = "contentsService")
    private ContentsService contentsService;
	
	@Resource(name = "utilService")
	private UtilService utilService;

	@Resource(name = "fileUpload")
	private FileUpload fileUpload;
	
	@Resource(name = "fileUploadService")
	private FileUploadService fileUploadService;
 	
    // 메인 페이지 호출 컨트롤러 (컨트롤러 명 수정가능)
	@RequestMapping(value="/main.do")
	public String retrieveMainPage(String redirectUrl, Menu menu, ModelMap model, HttpSession session){
		
		String loginChk = (String) session.getAttribute("userId");
		
		if (loginChk != null) {
		
			String deviceType = (String) session.getAttribute("deviceType");
			
			session.removeAttribute("menuId");
			session.removeAttribute("mainMenuId");
			session.removeAttribute("parentMenuId");
			session.removeAttribute("menuType");
					
			menu.setMenuType("FR");
			List<Menu> menuList = menuService.retrieveMenuList(menu);
			List<Contents> resultRegistrtionList = contentsService.resultRegistrtionList("FR110000");
			List<Contents> resultAcademyList = contentsService.resultAcademyList("FR090000");
			
			model.addAttribute("menuList", menuList);		
			model.addAttribute("resultRegistrtionList", resultRegistrtionList);
			model.addAttribute("resultAcademyList", resultAcademyList);
	
	        if (deviceType != null && deviceType.equals("mobile")) {
	        
	        	return "mobileMain";
	        
	        } else {
	        	
	        	return "main";        	
	        	
	        }
        
		} else {
			
			return "common/error/lostSession";
			
		}
        
	}
 	
    // admin 메인 페이지 호출 컨트롤러 (컨트롤러 명 수정가능)
	@RequestMapping(value="/admin.do")
	public String retrieveAdminMainPage(String redirectUrl, Menu menu, ModelMap model, HttpSession session){
		
		String loginChk = (String) session.getAttribute("userId");
		
		if (loginChk != null) {
		
			session.removeAttribute("menuId");
			session.removeAttribute("mainMenuId");
			session.removeAttribute("parentMenuId");
			session.removeAttribute("menuType");
			
			menu.setMenuType("FR");
			List<Menu> menuList = menuService.retrieveMenuList(menu);
			model.addAttribute("menuList", menuList);
			
			return "adminMain";
        
		} else {
			
			return "common/error/lostSession";
			
		}
		
	}
	
	@RequestMapping(value="/contents.do")
	public String retrieveContentsList(Menu input, ModelMap model, HttpSession session){
		
		String loginChk = (String) session.getAttribute("userId");
		
		if (loginChk != null) {
			
			if (input.getMenuId() == null || input.getMenuId().trim().equals("")) {
				input.setMenuId(session.getAttribute("menuId").toString());
				input.setUserId(loginChk);
				input.setModCode("list");
			}

			Menu menu = menuService.retrieveReturnMenuInfo(input);
			
			String returnDo = "forward:"+menu.getReturnDo();
			
			return returnDo;
		
		} else {
		
			return "common/error/lostSession";
		
		}
		
	}
	
	@RequestMapping(value="/contentsDetail.do")
	public String retrieveContentsDetail(Menu input, ModelMap model, HttpSession session){
		
		String loginChk = (String) session.getAttribute("userId");
		
		if (loginChk != null) {
			
			if (input.getMenuId() == null || input.getMenuId().trim().equals("")) {
				input.setMenuId(session.getAttribute("menuId").toString());
				input.setUserId(loginChk);
				input.setModCode("Detail");
			}

			Menu menu = menuService.retrieveReturnMenuInfo(input);
			
			String returnDo = "forward:"+menu.getReturnDo();
			
			return returnDo;
		
		} else {
		
			return "common/error/lostSession";
		
		}
		
	}
	
	@RequestMapping(value="/admin/contents.do")
	public String retrieveAdminContentsList(Menu input, ModelMap model, HttpSession session){
		
		String loginChk = (String) session.getAttribute("userId");
		
		if (loginChk != null) {
			
			if (input.getMenuId() == null || input.getMenuId().trim().equals("")) {
				input.setMenuId(session.getAttribute("menuId").toString());
				input.setUserId(loginChk);
			}
			
			if (input.getMenuId().substring(0, 2) != "AD") {
				Menu changeId = menuService.retrieveMenuIdChange(input);
				input.setMenuId(changeId.getAdminId());	
		    	session.setAttribute("menuId", changeId.getAdminId());	
		    	session.setAttribute("mainMenuId", changeId.getAdminId().substring(0,6));
		    	session.setAttribute("parentMenuId", changeId.getAdminId().substring(0,4));
		    	session.setAttribute("menuType", changeId.getAdminId().substring(0,2));					
			}
			
			input.setModCode("list");

			Menu menu = menuService.retrieveReturnMenuInfo(input);			
			String returnDo = "forward:"+menu.getReturnDo();

			return returnDo;
		
		} else {
		
			return "common/error/lostSession";
		
		}
		
	}
	
	@RequestMapping(value="/mypage.do")
	public String retrieveMypageList(Menu input, ModelMap model, HttpSession session){
		
		String loginChk = (String) session.getAttribute("userId");
		
		if (loginChk != null) {
			
			if (input.getMenuId() == null || input.getMenuId().trim().equals("")) {
				input.setMenuId(session.getAttribute("menuId").toString());
				input.setUserId(loginChk);
				input.setModCode("list");
			}

			Menu menu = menuService.retrieveReturnMenuInfo(input);
			
			String returnDo = "forward:"+menu.getReturnDo();
			
			return returnDo;
		
		} else {
		
			return "common/error/lostSession";
		
		}
		
	}
	
	@RequestMapping(value="/admin/user/user.do")
	public String retrieveAdminUserList(Menu input, ModelMap model, HttpSession session){
		
		String loginChk = (String) session.getAttribute("userId");
		
		if (loginChk != null) {
			
			if (input.getMenuId() == null || input.getMenuId().trim().equals("")) {
				input.setMenuId(session.getAttribute("menuId").toString());
				input.setUserId(loginChk);
				input.setModCode("list");
			}

			Menu menu = menuService.retrieveReturnMenuInfo(input);
			
			String returnDo = "forward:"+menu.getReturnDo();
			
			return returnDo;
		
		} else {
		
			return "common/error/lostSession";
		
		}
		
	}
	
}
