package devonframe.gyva.admin.user.manager.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import devonframe.gyva.front.common.code.model.Code;
import devonframe.gyva.admin.user.manager.model.Manager;
import devonframe.gyva.admin.user.manager.service.ManagerService;

import devonframe.message.saymessage.SayMessage;

/**
 * <pre>
 * 관리자 정보에 대한 CRUD를 담당하는 Controller 클래스
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class AdminManagerController {

	@Resource(name = "managerService")
	private ManagerService managerService;

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor messageSourceAccessor;

	// 관리자 회원 단일 조회
	@RequestMapping(value = "/admin/user/manager/retrieveManager.do")
	public String retrieveManager(Manager input, ModelMap model) {
		System.out.println("\t\t\t ################################# retrieveManager start");
		Manager manager = null;
		manager = managerService.retrieveManager(input);

		System.out.println("manager toString:::[" + manager.toString() + "]");
		if (manager == null) {
			SayMessage.setMessageCode("dev.inf.com.nodata");
		}

		model.addAttribute("result", manager);
		System.out.println("\t\t\t ################################# retrieveManager e n d");
		return "admin/managerLogin/myPageForm";

	}

	// 관리자 회원 다중 조회
	@RequestMapping(value = "/admin/user/manager/retrieveManagerList.do")
	public String retrieveManagerList(Code codeDetail, Manager input, ModelMap model) {
		System.out.println("\t\t\t ################################# retrieveManagerList start");
		// input.setUserType("AD");
		List<Manager> managerList = null;
		managerList = managerService.retrieveManagerList(input);

		List<Code> codeDetailList = null;
		codeDetailList = managerService.retrieveCodeDetailList(codeDetail);

		// for (Manager manager : managerList) {
		// System.out.println(manager.toString());
		// System.out.println("=========================================");
		// }
		if (managerList.size() == 0) {
			SayMessage.setMessageCode("dev.inf.com.nodata");
		}

		model.addAttribute("input", input);
		model.addAttribute("resultList", managerList);
		model.addAttribute("codeDetailList", codeDetailList);
		System.out.println("\t\t\t ################################# retrieveManagerList end");
		return "admin/user/manager/list";
		// return "redirect:/admin/user/manager/retrieveManagerList.do";

	}

	// 관리자 회원 가입
	@RequestMapping(value = "/admin/user/manager/insertManager.do")
	public String insertManager(Manager input, ModelMap model) {
		System.out.println("\t\t\t ################################# insertManager");
		System.out.println("manager print");
		System.out.println(input);
		managerService.insertManager(input);
		return "redirect:/admin/user/manager/retrieveManagerList.do?msg=success";
	}

	// 관리자 회원 정보 수정
	@RequestMapping(value = "/admin/user/manager/updateManager.do")
	public String updateManager(Manager input, ModelMap model) {
		System.out.println("\t\t\t ################################# updateManager ");
		managerService.updateManager(input);
		return "redirect:/admin/user/manager/retrieveManagerList.do?msg=success";
	}

	// 관리자 회원 정보 삭제
	@RequestMapping(value = "/admin/user/manager/deleteManager.do")
	public String deleteManager(Manager input, String realDelete, ModelMap model) {
		System.out.println("[============================deleteManager]");
		if (realDelete.equals("N")) {
			System.out.println("[update Manager delete_yn field to Y]");
			input.setDeleteYn("Y");
			managerService.updateManager(input);
		}

		return "redirect:/admin/user/manager/retrieveManagerList.do?msg=success";
	}

	/*
	// 관리자 메인 페이지
	@RequestMapping(value = "/admin/user/manager/managerMain.do")
	public String retrieveMainPage(String redirectUrl, ModelMap model) {
		if (redirectUrl != null && !redirectUrl.trim().equals("")) {
			model.addAttribute("redirectUrl", redirectUrl);
			String menuCode = redirectUrl.substring(0, redirectUrl.indexOf("/"));
			if (redirectUrl.startsWith("/")) {
				menuCode = redirectUrl.substring(1);
				menuCode = menuCode.substring(0, menuCode.indexOf("/"));
			}
			model.addAttribute("menuCode", menuCode);
		}
		return "admin/main";
	}
	*/

	// 관리자 가입 페이지
	@RequestMapping(value = "/admin/user/manager/joinForm.do")
	public String joinForm(Code codeDetail, ModelMap model) {
		System.out.println("\t\t\t ################################# joinForm ");
		List<Code> codeDetailList = null;
		codeDetailList = managerService.retrieveCodeDetailList(codeDetail);
		model.addAttribute("codeDetailList", codeDetailList);
		return "admin/user/manager/create";
	}

	// 관리자 수정 페이지 (새로 분류한 페이지)
	@RequestMapping(value = "/admin/user/manager/updateForm.do")
	public String updateForm(Manager input, Code codeDetail, ModelMap model, HttpSession session) {
		System.out.println("\t\t\t ################################# updateForm ");
		Manager result = managerService.retrieveManager(input);

		List<Code> codeDetailList = null;
		codeDetailList = managerService.retrieveCodeDetailList(codeDetail);

		model.addAttribute("codeDetailList", codeDetailList);
		model.addAttribute("result", result);
		return "admin/user/manager/edit";
	}

	// 관리자 상세 페이지 (새로 분류한 페이지)
	@RequestMapping(value = "/admin/user/manager/detailForm.do")
	public String detailForm(Manager input, Code codeDetail, ModelMap model, HttpSession session) {
		System.out.println("\t\t\t ################################# detailForm ");
		Manager result = managerService.retrieveManager(input);

		List<Code> codeDetailList = null;
		codeDetailList = managerService.retrieveCodeDetailList(codeDetail);

		model.addAttribute("codeDetailList", codeDetailList);
		model.addAttribute("result", result);
		return "admin/user/manager/detailForm";
	}

	// 관리자 다중조회 페이지
	@RequestMapping(value = "/admin/user/manager/retrieveManagerListForm.do")
	public String retrieveManagerListForm(Manager input, Code codeDetail, ModelMap model, HttpSession session) {
		input.setUserType("AD");
		input.setDeleteYn("N");
		List<Manager> managerList = null;
		managerList = managerService.retrieveManagerList(input);

		List<Code> codeDetailList = null;
		codeDetailList = managerService.retrieveCodeDetailList(codeDetail);
		model.addAttribute("codeDetailList", codeDetailList);
		model.addAttribute("resultList", managerList);

		System.out.println("\t\t\t ################################# retrieveManagerList ");
		return "admin/user/manager/list";
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/admin/user/manager/idChk.do")
	public int idChk(Manager input, ModelMap model) {
		System.out.println("\t\t\t ################################# idChk ");
		int result = managerService.idChk(input);
		System.out.println("result::::::" + result);
		return result;
	}

	// 일반 관리자 인증 페이지
	@RequestMapping("/admin/user/manager/certificationForm.do")
	public String certificationForm(@ModelAttribute Manager input, ModelMap model, HttpSession session) {
		System.out.println("\t\t\t ################################# certificationForm ");
		String userId = (String) session.getAttribute("userId");
		input.setEmail(userId);
		
		model.addAttribute("result", input);
		return "admin/user/manager/certificationForm";
	}

	// 일반관리자 인증
	@RequestMapping("/admin/user/manager/certification.do")
	public String certification(@ModelAttribute Manager input, ModelMap model, HttpSession session) {
		System.out.println("\t\t\t ################################# admin certification start");
		System.out.println("input :::[" + input + "]");

		boolean isExistUser = managerService.checkUserId(input);
		if (!isExistUser) {
			model.addAttribute("errorMsg", messageSourceAccessor.getMessage("gyva.common.login.invalidUserId"));

			return "admin/user/manager/certificationForm";
		}

		boolean isValidUser = managerService.checkUser(input);
		if (isValidUser) {
			Manager certificationManager = managerService.retrieveManager(input);
			session.setAttribute("certificationManager", certificationManager);
			return "redirect:/admin/user/manager/updateForm.do";
		}

		model.addAttribute("errorMsg", messageSourceAccessor.getMessage("gyva.common.login.invalidPassword"));
		System.out.println("\t\t\t ################################# admin certification end");
		return "admin/user/manager/certificationForm";
	}
}