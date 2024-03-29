package devonframe.gyva.admin.contents.partner.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class AdminPartnerContentsController {

    @Resource(name = "contentsService")
    private ContentsService contentsService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "utilService")
	private UtilService utilService;

	@Resource(name = "fileUpload")
	private FileUpload fileUpload;

	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "fileUploadService")
	private FileUploadService fileUploadService;
    
    @RequestMapping(value="/admin/contents/partner/retrieveContentsList.do")
    public String retrieveContentsList(Contents input, ModelMap model){
    	
    	List<Contents> resultList = contentsService.retrieveContentsList(input);
        model.addAttribute("resultList", resultList);
        
        return "admin/contents/library/partner/contentsList";
    }
    
    @RequestMapping(value="/admin/contents/partner/retrieveContents.do")
    public String retrieveContentsDetail(Contents input, ModelMap model){

    	Contents contents = contentsService.retrieveContents(input);
    	
        model.addAttribute("result", contents);

        return "admin/contents/library/partner/contentsDetail";
    }
	
	// 관리자 Contents 입력 페이지
	@RequestMapping(value = "/admin/contents/library/partner/contentsWrite.do")
	public String contentsWrite(Contents input, ModelMap model, HttpSession session) {
		
		List<User> resultList = userService.retrieveLecturerList(input);
		
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
//		String nextContentsId =  contentsService.retrieveNextContentsId(input);
		String nextContentsId =  contentsService.retrieveFunNextContentsId("partner_id");
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("menuId", menuId);
		model.addAttribute("nextContentsId", nextContentsId);
		return "admin/contents/library/partner/contentsWrite";
	}
	
	// 관리자 Contents 수정 페이지 호출
	@RequestMapping(value = "/admin/contents/library/partner/updateContentsPage.do")
	public String contentsUpdate(Contents input, Code code, ModelMap model, HttpSession session) {
		List<User> resultList = userService.retrieveLecturerList(input);

		input.setUserId((String) session.getAttribute("userId"));
		Contents contents = contentsService.retrieveContents(input);

		code.setCodeGroup(input.getMenuId());
		List<Code> categoryCodeList = codeService.retrieveCodeList(code);

		model.addAttribute("resultList", resultList);
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("contentsResult", contents);

		return "admin/contents/library/partner/contentsUpdate";
	}
	
	// Contents 저장
	@RequestMapping(value = "/admin/contents/partner/insertContents.do")
	public String insertContents(Contents input, ModelMap model, MultipartHttpServletRequest mpRequest, HttpSession session) {

		String fildId = utilService.getRandomUuid(10);
		input.setFileId(fildId);	// 신규 생성 랜덤 fileId 세팅
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
			multipartFile = mpRequest.getFile(iterator.next());
			
			if (multipartFile.isEmpty() == false) {
				UploadFileInfo uploadFileInfo = fileUpload.upload(multipartFile);

				fileName = uploadFileInfo.getClientFileName();
				uploadFilePath = uploadFileInfo.getServerPath();
				uploadFileName = uploadFileInfo.getServerFileName();
				fileSize = uploadFileInfo.getSize();
				fileExtension = uploadFileInfo.getClientFileName().substring(uploadFileInfo.getClientFileName().lastIndexOf(".") + 1);

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
					
					// contents 사진 파일 저장
					fileUploadService.insertFileInfo(listMap);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				}
			}
		}

		System.out.println("\t\t input.toString():"+input.toString());
		// contents_info 테이블에 저장
		contentsService.insertContents(input);
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
		String redirectUrl = "redirect:/contents/partner/retrieveContentsList.do?menuId=" + menuId;
		
		return redirectUrl;
	}

	// Contents 수정 처리
	@RequestMapping(value = "/admin/contents/library/partner/updateContents.do")
	public String updateContents(Contents input, ModelMap model, MultipartHttpServletRequest mpRequest, HttpSession session) {
		System.out.println("\t\t\t ################################# updateContents ");

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
					// contents 사진 파일 저장
					fileUploadService.insertFileInfo(listMap);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				}
			}
		}

		System.out.println("\t\t input.toString():" + input.toString());

		// contents_info 테이블에 저장
		contentsService.updateContents(input);
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
		String redirectUrl = "redirect:/contents/partner/retrieveContentsList.do?menuId=" + menuId;
		
		return redirectUrl;
	}
		
	// Contents 삭제
	@RequestMapping(value = "/admin/contents/library/partner/deleteContents.do")
	public String deleteContents(Contents input, ModelMap model,HttpSession session) {
	
		String userId = null;
		userId = (String) session.getAttribute("userId");
		input.setUserId(userId);
		
		contentsService.updateDeleteYnContents(input);
		String menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");

		String redirectUrl = "redirect:/contents/partner/retrieveContentsList.do?menuId=" + menuId;
		
		return redirectUrl;
	}
	
}
