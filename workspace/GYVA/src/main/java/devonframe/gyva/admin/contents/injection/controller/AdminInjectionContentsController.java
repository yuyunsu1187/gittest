package devonframe.gyva.admin.contents.injection.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import devonframe.fileupload.FileUpload;
import devonframe.fileupload.model.UploadFileInfo;
import devonframe.gyva.front.common.code.model.Code;
import devonframe.gyva.front.common.code.service.CodeService;
import devonframe.gyva.front.common.fileupload.service.FileUploadService;
import devonframe.gyva.front.common.user.model.User;
import devonframe.gyva.front.common.user.service.UserService;
import devonframe.gyva.front.common.util.UtilService;
import devonframe.gyva.front.contents.model.Contents;
import devonframe.gyva.front.contents.service.ContentsService;

@Controller
public class AdminInjectionContentsController {

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

	@RequestMapping(value = "/admin/contents/injection/retrieveContentsList.do")
	public String retrieveContentsList(HttpServletRequest request, Contents input, ModelMap model, HttpSession session) {

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

		input.setCategoryCode("02");
		List<Contents> midList = contentsService.retrieveContentsList(input);

		input.setCategoryCode("03");
		List<Contents> lowList = contentsService.retrieveContentsList(input);
		
		input.setCategoryCode("04");
        List<Contents> exclusiveList = contentsService.retrieveContentsList(input);

		model.addAttribute("upperList", upperList);
		model.addAttribute("midList", midList);
		model.addAttribute("lowList", lowList);
		model.addAttribute("exclusiveList", exclusiveList);
		return "admin/contents/academy/injection/contentsList";
	}

	@RequestMapping(value = "/admin/contents/injection/retrieveContents.do")
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

		return "admin/contents/academy/injection/contentsDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/contents/injection/updateLikeDislike.do")
	public Contents updateLikeDislike(Contents input, ModelMap model, HttpSession session) {

		if (contentsService.retrieveFrontMenuId(input) != null
				&& !"".equals(contentsService.retrieveFrontMenuId(input))) {
			input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
		}

		System.out.println("\t\t\t ################################# updateLikeDislike ");
		input.setUserId((String) session.getAttribute("userId"));
		System.out.println("before logic input ========== " + input.toString());

		Contents contents = contentsService.retrieveContents(input);
		System.out.println("contents.dislikeYn ===== " + contents.getDislikeYn());

		if (contents.getDislikeYn() != null && contents.getDislikeYn() != "") {
			contentsService.updateLikeDislike(contents);
		} else {
			System.out.println("insert logic input ========== " + input.toString());
			contentsService.insertLikeDislike(input);
		}

		System.out.println("\t\t\t ### updateLikeDislike END ");
		contents = contentsService.retrieveContents(input);
		return contents;
	}

	// 관리자 Contents 입력 페이지
	@RequestMapping(value = "/admin/contents/academy/injection/contentsWrite.do")
	public String contentsInjectionWrite(Contents input, Code code, ModelMap model, HttpSession session) {

		List<User> resultList = userService.retrieveLecturerList(input);
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
		input.setMenuId(menuId);

		if (contentsService.retrieveFrontMenuId(input) != null
				&& !"".equals(contentsService.retrieveFrontMenuId(input))) {
			menuId = contentsService.retrieveFrontMenuId(input).getMenuId();
			input.setMenuId(menuId);
		}

		code.setCodeGroup(menuId);
		List<Code> categoryCodeList = codeService.retrieveCodeList(code);
		List<Code> surveyList = codeService.retrieveSurveyList();
		
		String nextContentsId = contentsService.retrieveNextContentsId(input);

		model.addAttribute("resultList", resultList);
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("surveyList", surveyList);
		model.addAttribute("nextContentsId", nextContentsId);
		return "admin/contents/academy/injection/contentsWrite";
	}

	// 관리자 Contents 수정 페이지
	@RequestMapping(value = "/admin/contents/academy/injection/contentsUpdate.do")
	public String contentsInjectionUpdate(Contents input, Code code, ModelMap model, HttpSession session) {

		List<User> resultList = userService.retrieveLecturerList(input);
		input.setUserId((String) session.getAttribute("userId"));
		Contents contents = contentsService.retrieveContents(input);

		code.setCodeGroup(input.getMenuId());
		List<Code> categoryCodeList = codeService.retrieveCodeList(code);
		List<Code> surveyList = codeService.retrieveSurveyList();
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("surveyList", surveyList);
		model.addAttribute("contentsResult", contents);

		return "admin/contents/academy/injection/contentsUpdate";
	}

	// 강사 정보 조회
	@ResponseBody
	@RequestMapping(value = "/admin/contents/academy/injection/retrieveLecturerInfo.do")
	public User retrieveLecturerInfo(User input, ModelMap model) {

		User lecturer = userService.retrieveLecturer(input);
		System.out.println("============= lecturer");
		System.out.println(lecturer.toString());
		return lecturer;
	}

	// Contents 저장
	@RequestMapping(value = "/admin/contents/academy/injection/insertContents.do")
	public String insertContents(Contents input, Code code, ModelMap model, MultipartHttpServletRequest mpRequest,
			HttpSession session) {
		System.out.println("\t\t\t ################################# insertContents ");
		
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");		
		input.setMenuId(menuId);

		if (contentsService.retrieveFrontMenuId(input) != null
				&& !"".equals(contentsService.retrieveFrontMenuId(input))) {
			input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
		}
		
		code.setCodeGroup(menuId);
		String nextContentsId = contentsService.retrieveNextContentsId(input);
		input.setContentsId(nextContentsId);
		
		String fildId = utilService.getRandomUuid(10);
		input.setFileId(fildId); // 신규 생성 랜덤 fileId 세팅
		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		int fileNumber = 1;
		String fileName = null;
		String uploadFilePath = null;
		String uploadFileName = null;
		long fileSize = 0;
		String fileExtension = null;
		String userId = null;

		// file과 contents에 남길 userId 세팅
		userId = (String) session.getAttribute("userId");
		input.setUserId(userId);

		Map<String, Object> listMap = null;

		while (iterator.hasNext()) {
			System.out.println("=================================== fileNumber[" + fileNumber
					+ "]mpRequest.getFileNames()[" + mpRequest.getFileNames() + "]");
			multipartFile = mpRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				UploadFileInfo uploadFileInfo = fileUpload.upload(multipartFile);

				fileName = uploadFileInfo.getClientFileName();
				uploadFilePath = uploadFileInfo.getServerPath();
				uploadFileName = uploadFileInfo.getServerFileName();
				fileSize = uploadFileInfo.getSize();
				fileExtension = uploadFileInfo.getClientFileName()
						.substring(uploadFileInfo.getClientFileName().lastIndexOf(".") + 1);

				try {
					listMap = new HashMap<String, Object>();
					listMap.put("fileId", fildId);
					listMap.put("fileNumber", fileNumber++);
					listMap.put("fileName", fileName);
					listMap.put("uploadFilePath", uploadFilePath);
					listMap.put("uploadFileName", uploadFileName);
					listMap.put("fileSize", fileSize);
					listMap.put("fileExtension", fileExtension);
					listMap.put("createId", userId);
					listMap.put("updateId", userId);
					System.out.println("\t\t QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ " + listMap.toString());
					// contents 사진 파일 저장
					fileUploadService.insertFileInfo(listMap);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				}
			}
		}

		System.out.println("\t\t input.toString():" + input.toString());
		// contents_info 테이블에 저장
		contentsService.insertContents(input);
	
		System.out.println("===================== session menuId : " + (String) session.getAttribute("MenuInfoInterceptor_menuId"));
		String redirectUrl = "redirect:/admin/contents/injection/retrieveContentsList.do?menuId=" + menuId;
		
		return redirectUrl;
	}

	// Contents 수정
	@RequestMapping(value = "/admin/contents/academy/injection/updateContents.do")
	public String updateContents(Contents input, ModelMap model, MultipartHttpServletRequest mpRequest,
			HttpSession session) {
		System.out.println("\t\t\t ################################# updateContents ");

		Iterator<String> iterator = mpRequest.getFileNames();
		
		String fildId = input.getFileId();
		MultipartFile multipartFile = null;
		int fileNumber = 0;
		String fileName = null;
		String uploadFilePath = null;
		String uploadFileName = null;
		long fileSize = 0;
		String fileExtension = null;
		String userId = null;
		String requestName;

		// file과 contents에 남길 userId 세팅
		userId = (String) session.getAttribute("userId");
		input.setUserId(userId);

		Map<String, Object> listMap = null;

		while (iterator.hasNext()) {
			System.out.println("=================================== fileNumber[" + fileNumber
					+ "]mpRequest.getFileNames()[" + mpRequest.getFileNames() + "]");
			multipartFile = mpRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				UploadFileInfo uploadFileInfo = fileUpload.upload(multipartFile);
				
				requestName = multipartFile.getName();
				System.out.println("=========== requestName : " + requestName);
				fileNumber = Integer.parseInt(requestName.substring(requestName.indexOf("_")+1));
				System.out.println("=========== fileNumber : " + fileNumber);
				
				fileName = uploadFileInfo.getClientFileName();
				uploadFilePath = uploadFileInfo.getServerPath();
				uploadFileName = uploadFileInfo.getServerFileName();
				fileSize = uploadFileInfo.getSize();
				fileExtension = uploadFileInfo.getClientFileName()
						.substring(uploadFileInfo.getClientFileName().lastIndexOf(".") + 1);

				try {
					listMap = new HashMap<String, Object>();
					listMap.put("fileId", fildId);
					listMap.put("fileNumber", fileNumber);
					listMap.put("fileName", fileName);
					listMap.put("uploadFilePath", uploadFilePath);
					listMap.put("uploadFileName", uploadFileName);
					listMap.put("fileSize", fileSize);
					listMap.put("fileExtension", fileExtension);
					listMap.put("updateId", userId);
					System.out.println("\t\t QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ " + listMap.toString());
					// contents 사진 파일 저장
					fileUploadService.updateFileInfo(listMap);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				}
			}
		}

		System.out.println("\t\t input.toString():" + input.toString());

		// contents_info 테이블에 저장
		contentsService.updateContents(input);
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
		System.out.println("===================== session menuId : " + (String) session.getAttribute("MenuInfoInterceptor_menuId"));
		String redirectUrl = "redirect:/admin/contents/injection/retrieveContentsList.do?menuId=" + menuId;
		
		return redirectUrl;
	}

	// Contents 삭제
	@RequestMapping(value = "/admin/contents/academy/injection/deleteContents.do")
	public String deleteContents(Contents input, ModelMap model,
			HttpSession session) {
		System.out.println("\t\t\t ################################# updateContents ");
		
		String userId = null;
		userId = (String) session.getAttribute("userId");
		input.setUserId(userId);
		
		contentsService.updateDeleteYnContents(input);
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
		System.out.println("===================== session menuId : " + (String) session.getAttribute("MenuInfoInterceptor_menuId"));
		String redirectUrl = "redirect:/admin/contents/injection/retrieveContentsList.do?menuId=" + menuId;
		
		return redirectUrl;
	}
}
