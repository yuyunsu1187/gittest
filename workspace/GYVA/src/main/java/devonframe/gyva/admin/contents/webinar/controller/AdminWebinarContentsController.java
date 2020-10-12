package devonframe.gyva.admin.contents.webinar.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.fileupload.FileUpload;
import devonframe.gyva.front.common.code.service.CodeService;
import devonframe.gyva.front.common.fileupload.service.FileUploadService;
import devonframe.gyva.front.common.user.service.UserService;
import devonframe.gyva.front.common.util.UtilService;
import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.service.ContentsService;

@Controller
public class AdminWebinarContentsController {

	@Resource(name = "contentsService")
	private ContentsService contentsService;

	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "utilService")
	private UtilService utilService;

	@Resource(name = "fileUpload")
	private FileUpload fileUpload;

	@Resource(name = "fileUploadService")
	private FileUploadService fileUploadService;

	@RequestMapping(value = "/admin/contents/webinar/retrieveContentsList.do")
	public String retrieveContentsList(HttpServletRequest request, Contents input, ModelMap model,
			HttpSession session) {

		// List<Contents> resultList =
		// contentsService.retrieveContentsList(input);
		// model.addAttribute("resultList", resultList);

		System.out.println("===================== session menuId : "
				+ (String) session.getAttribute("MenuInfoInterceptor_menuId"));

		model.addAttribute("selectedCategoryCode", input.getCategoryCode());
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
		input.setMenuId(menuId);

		if (contentsService.retrieveFrontMenuId(input) != null
				&& !"".equals(contentsService.retrieveFrontMenuId(input))) {
			input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
		}

		System.out.println("===================== request menuId : " + (String) request.getAttribute("menuId"));
		// request.setAttribute("menuId", (String)
		// session.getAttribute("MenuInfoInterceptor_menuId"));
		System.out.println(
				"===================== after work request menuId : " + (String) request.getAttribute("menuId"));

		input.setUserId((String) session.getAttribute("userId"));
		input.setCategoryCode("01");
		List<Contents> upperList = contentsService.retrieveContentsList(input);

		return "admin/contents/academy/webinar/contentsList";
	}

	@RequestMapping(value = "/admin/contents/webinar/retrieveContents.do")
	public String retrieveContentsDetail(Contents input, ModelMap model, HttpSession session, String mode) {

		System.out.println("===================== menuId : " + (String) session.getAttribute("MenuInfoInterceptor_menuId"));
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
		input.setMenuId(menuId);
		
		if (contentsService.retrieveFrontMenuId(input) != null
				&& !"".equals(contentsService.retrieveFrontMenuId(input))) {
			input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
		}

		System.out.println("===================== mode : " + mode);

		input.setUserId((String) session.getAttribute("userId"));
		Contents contents = contentsService.retrieveContents(input);
		String categoryCode = contents.getCategoryCode();
		input.setCategoryCode(categoryCode);

		String nextContentsId = null;
		if (mode != null && !mode.equals("")) {
			if (mode.equals("previous")) {
				nextContentsId = contentsService.retrieveBiggestContentsId(input);
			} else {
				nextContentsId = contentsService.retrieveSmallestContentsId(input);
			}
			input.setContentsId(nextContentsId);
			contents = contentsService.retrieveContents(input);
			input.setContentsId(null);
		}

		String biggestContentsId = contentsService.retrieveBiggestContentsId(input);
		String smallestContentsId = contentsService.retrieveSmallestContentsId(input);

		model.addAttribute("result", contents);
		model.addAttribute("biggestContentsId", biggestContentsId);
		model.addAttribute("smallestContentsId", smallestContentsId);

		return "admin/contents/academy/webinar/contentsDetail";
	}

}
