package devonframe.gyva.contents.anatomy.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import devonframe.fileupload.FileUpload;
import devonframe.fileupload.model.UploadFileInfo;
import devonframe.gyva.admin.contents.survey.model.Survey;
import devonframe.gyva.admin.contents.survey.service.SurveyService;
import devonframe.gyva.admin.system.code.model.Code;
import devonframe.gyva.admin.system.code.service.CodeService;
import devonframe.gyva.admin.system.log.model.Log;
import devonframe.gyva.admin.system.log.service.LogService;
import devonframe.gyva.admin.user.helpdesk.model.Helpdesk;
import devonframe.gyva.admin.user.helpdesk.service.HelpdeskService;
import devonframe.gyva.common.fileupload.service.FileUploadService;
import devonframe.gyva.common.menu.model.Menu;
import devonframe.gyva.common.menu.service.MenuService;
import devonframe.gyva.common.user.model.User;
import devonframe.gyva.common.user.service.UserService;
import devonframe.gyva.common.util.UtilService;
import devonframe.gyva.contents.model.Contents;
import devonframe.gyva.contents.service.ContentsService;

@Controller
public class AnatomyContentsController {
	
    @Resource(name = "logService")
    private LogService logService;
    
    @Resource(name = "menuService")
    private MenuService menuService;

	@Resource(name = "codeService")
	private CodeService codeService;

    @Resource(name = "contentsService")
    private ContentsService contentsService;

    @Resource(name = "helpdeskService")
    private HelpdeskService helpdeskService;
	
	@Resource(name = "userService")
	private UserService userService;

    @Resource(name = "surveyService")
    private SurveyService surveyService;
	
	@Resource(name = "utilService")
	private UtilService utilService;

	@Resource(name = "fileUpload")
	private FileUpload fileUpload;
	
	@Resource(name = "fileUploadService")
	private FileUploadService fileUploadService;
	
	static final Logger LOGGER = LoggerFactory.getLogger(AnatomyContentsController.class);
    
    @RequestMapping(value="/contents/anatomyList.do")
    public String retrieveContentsList(Contents input, ModelMap model, HttpSession session){

		String menuId = (String) session.getAttribute("menuId");		
		input.setMenuId(menuId);
	    	
		Menu menu = menuService.retrieveCallMenuInfo(input);
		
		String loginChk = (String) session.getAttribute("userId");
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = menu.getListUrl();

		if (loginChk != null) {
			
			if (!menu.getMenuType().equals("AD")) { 
	
				Log log = new Log();
				log.setUserId((String) loginChk);
				log.setMenuId((String) input.getMenuId());
				log.setContentsId((String) input.getContentsId());
				log.setCategoryCode((String) input.getCategoryCode());
	
				logService.insertLog(log);
			
			}  
				
			if (menu.getMenuType().equals("AD")) {
				
				input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
				
			}

			input.setUserId(loginChk);
	        input.setCategoryCode("01");
	        List<Contents> upperList = contentsService.retrieveContentsList(input);		        
	        input.setCategoryCode("02");
	        List<Contents> midList = contentsService.retrieveContentsList(input);		        
	        input.setCategoryCode("03");
	        List<Contents> lowList = contentsService.retrieveContentsList(input);

	        model.addAttribute("input", input);
	        model.addAttribute("menu", menu);
	        model.addAttribute("upperList", upperList);
	        model.addAttribute("midList", midList);
	        model.addAttribute("lowList", lowList);
			
			if (deviceType != null && deviceType.equals("mobile")) {
				
				returnUrl = deviceType + "/" + returnUrl;
				
			}

			return returnUrl;
		
    	} else {    		
		
    		return "common/error/lostSession";  
			
    	} 	
    	
    }
    
    @RequestMapping(value="/contents/anatomyDetail.do")
    public String retrieveContentsDetail(Contents input, Code code, ModelMap model, HttpSession session){
    	
		Menu menu = menuService.retrieveCallMenuInfo(input);
		
		String loginChk = (String) session.getAttribute("userId");
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = menu.getDetailUrl();
    	
    	if (loginChk != null) {
			
			if (!menu.getMenuType().equals("AD")) { 
				
				Log log = new Log();
				log.setUserId((String) loginChk);
				log.setMenuId((String) input.getMenuId());
				log.setContentsId((String) input.getContentsId());
				log.setCategoryCode((String) input.getCategoryCode());
				
				logService.insertLog(log); 
				
			}  
			
			if (menu.getMenuType().equals("AD")) {
				
				input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
				
			}
	    	
	    	input.setUserId(loginChk);
	    	Contents result = contentsService.retrieveContents(input);

	    	Helpdesk helpdeskInput = new Helpdesk();
	    	helpdeskInput.setStateCode(null);
	    	helpdeskInput.setUserId(input.getUserId());
	    	helpdeskInput.setMenuId(input.getMenuId());
	    	helpdeskInput.setContentsId(input.getContentsId());	    	
	    	List<Helpdesk> helpdeskList = helpdeskService.retrieveHelpdeskContentsList(helpdeskInput);	  
			
	    	Survey surveyInput = new Survey();
	    	surveyInput.setSurveyId(result.getSurveyId());
	    	Survey surveyList = surveyService.retrieveQuestionDetail(surveyInput);  	

			code.setCodeGroup("MC");
			List<Code> mcCodeList = codeService.retrieveCodeList(code);

	    	model.addAttribute("input", input);
	        model.addAttribute("menu", menu);
	        model.addAttribute("result", result);
	        model.addAttribute("helpdeskList", helpdeskList);
	        model.addAttribute("surveyList", surveyList);
	        model.addAttribute("mcCodeList", mcCodeList);
			
			if (deviceType != null && deviceType.equals("mobile")) {
				
				returnUrl = deviceType + "/" + returnUrl;
				
			}
	
	        return returnUrl;
			
		} else {    		
		
			return "redirect:/lostSession.do";  
			
		} 	
    	
    }
    
    @RequestMapping(value="/contents/anatomy/insertQuestionInfo.do")
    public String insertQuestion(Helpdesk input, ModelMap model, HttpSession session){

		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = "contents/academy/anatomy/contentsDetail";
		
    	helpdeskService.insertQuestionInfo(input);

		input.setStateCode(null);
    	Contents contentsInput = new Contents();
    	contentsInput.setUserId(input.getUserId());
    	contentsInput.setMenuId(input.getMenuId());
    	contentsInput.setContentsId(input.getContentsId());	
    	
    	Contents result = contentsService.retrieveContents(contentsInput);
    	List<Helpdesk> helpdeskList = helpdeskService.retrieveHelpdeskContentsList(input);    	

    	model.addAttribute("input", input);
        model.addAttribute("result", result);
        model.addAttribute("helpdeskList", helpdeskList);
		
		if (deviceType != null && deviceType.equals("mobile")) {
			
			returnUrl = deviceType + "/" + returnUrl;
			
		}
    	
        return returnUrl;
        
    }  
	
	@RequestMapping(value="/contents/anatomy/updateQuestionInfo.do")
	public String updateQuestionInfo(Helpdesk input, ModelMap model, HttpSession session){

		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = "contents/academy/anatomy/contentsDetail";
    			
		if(input.getType().equals("D")) {
			input.setAnswerContents(null);
			input.setAnswerDate(null);
			input.setStateCode("01");			
		} 
		
		helpdeskService.updateQuestionInfo(input);

		input.setStateCode(null);
		Contents contentsInput = new Contents();
		contentsInput.setUserId(input.getUserId());
		contentsInput.setMenuId(input.getMenuId());
		contentsInput.setContentsId(input.getContentsId());	
		
		Contents result = contentsService.retrieveContents(contentsInput);
		List<Helpdesk> helpdeskList = helpdeskService.retrieveHelpdeskContentsList(input);    	

		model.addAttribute("input", input);
		model.addAttribute("result", result);
		model.addAttribute("helpdeskList", helpdeskList);
		
		if (deviceType != null && deviceType.equals("mobile")) {
			
			returnUrl = deviceType + "/" + returnUrl;
			
		}
		
		return returnUrl;
		
	}  
	
	@RequestMapping(value="/contents/anatomy/insertSurveyResult.do")
	public String insertSurveyResult(Survey input, ModelMap model, HttpSession session){
		
		String deviceType = (String) session.getAttribute("deviceType");
		String returnUrl = "redirect:/contents/anatomyList.do";
		
		surveyService.insertSurveyResult(input);
		
		model.addAttribute("input", input);

		
		if (deviceType != null && deviceType.equals("mobile")) {
			
			returnUrl = "redirect:/mobile/contents/anatomyList.do";
			
		}
		
		return returnUrl;
				
	}

	// 관리자 Contents 입력 페이지
	@RequestMapping(value = "/contents/anatomyWrite.do")
	public String contentsAcademyWrite(Contents input, Code code, ModelMap model, HttpSession session) {


		String menuId = contentsService.retrieveFrontMenuId(input).getMenuId();
		input.setMenuId(menuId);
		
		String nextContentsId =  contentsService.retrieveFunNextContentsId("anatomy_id");

		code.setCodeGroup(menuId);
		List<Code> categoryCodeList = codeService.retrieveCodeList(code);
		List<User> lecturerList = userService.retrieveLecturerList(input);
		List<Code> surveyList = codeService.retrieveSurveyList();

		model.addAttribute("input", input);
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("lecturerList", lecturerList);
		model.addAttribute("surveyList", surveyList);
		model.addAttribute("nextContentsId", nextContentsId);
		
		return "admin/contents/academy/anatomy/contentsWrite";
	}

	// 관리자 Contents 수정 페이지
	@RequestMapping(value = "/contents/anatomyEdit.do")
	public String contentsAcademyUpdate(Contents input, Code code, ModelMap model, HttpSession session) {

		input.setUserId((String) session.getAttribute("userId"));
		input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
		Contents contentsResult = contentsService.retrieveContents(input);

		code.setCodeGroup(input.getMenuId());
		List<Code> categoryCodeList = codeService.retrieveCodeList(code);
		List<User> lecturerList = userService.retrieveLecturerList(input);
		List<Code> surveyList = codeService.retrieveSurveyList();
		
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("lecturerList", lecturerList);
		model.addAttribute("surveyList", surveyList);
		model.addAttribute("contentsResult", contentsResult);

		return "admin/contents/academy/anatomy/contentsUpdate";
	}
	
	// Contents 저장
	@RequestMapping(value = "/contents/anatomyInsert.do")
	public String insertContents(Contents input, Code code, ModelMap model, MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception {
		
		String menuId = (String) session.getAttribute("menuId");		
		input.setMenuId(menuId);
		
		if (contentsService.retrieveFrontMenuId(input) != null
				&& !"".equals(contentsService.retrieveFrontMenuId(input))) {
			input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
		}
		
		code.setCodeGroup(menuId);
		
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
		String applicationPath = mpRequest.getServletContext().getRealPath("/"); //서버경로

		// file과 contents에 남길 userId 세팅
		userId = (String) session.getAttribute("userId");
		input.setUserId(userId);

		Map<String, Object> listMap = null;

		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				try {
					UploadFileInfo uploadFileInfo = fileUpload.upload(multipartFile);
	
					fileName = uploadFileInfo.getClientFileName();
					uploadFilePath = uploadFileInfo.getServerPath().replace(applicationPath, "/"); //서버경로 제외
					uploadFileName = uploadFileInfo.getServerFileName();
					fileSize = uploadFileInfo.getSize();
					fileExtension = uploadFileInfo.getClientFileName().substring(uploadFileInfo.getClientFileName().lastIndexOf(".") + 1);

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

				} catch (Exception e) {
					LOGGER.error("File Upload Error : " + e.getMessage());
					throw new Exception(this.getClass().getName(), e);
				}
			}
		}
		
		// contents_info 테이블에 저장
		contentsService.insertContents(input);
		
		String redirectUrl = "redirect:/contents.do";
		
		return redirectUrl;
	}

	// Contents 수정
	@RequestMapping(value = "/contents/anatomyUpdate.do")
	public String updateContents(Contents input, ModelMap model, MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception {

		String fildId = input.getFileId();
		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		int fileNumber = 1;
		String fileName = null;
		String uploadFilePath = null;
		String uploadFileName = null;
		long fileSize = 0;
		String fileExtension = null;
		String userId = null;
		String applicationPath = mpRequest.getServletContext().getRealPath("/"); //서버경로

		// file과 contents에 남길 userId 세팅
		userId = (String) session.getAttribute("userId");
		input.setUserId(userId);

		Map<String, Object> listMap = null;
		
		// 파일 존재 유무 구분값
		boolean fileCheck = false;
		
		
		String [] fileArr = new String[2]; 
		 
		int i = 0;
		while(iterator.hasNext()){
			fileArr[i] = iterator.next();
			i++;
		}
		
		for(String fileValue : fileArr){
			
			if("uploadFileThum".equals(fileValue)){
				multipartFile = mpRequest.getFile("uploadFileThum");
				fileNumber = 1;
			}else if("uploadFileDetail".equals(fileValue)){
				multipartFile = mpRequest.getFile("uploadFileDetail");
				fileNumber = 2;
			}
			
			if (multipartFile.isEmpty() == false) {
				try {
					fileCheck = true;
					
					UploadFileInfo uploadFileInfo = fileUpload.upload(multipartFile);
					fileName = uploadFileInfo.getClientFileName();
					uploadFilePath = uploadFileInfo.getServerPath().replace(applicationPath, "/"); //서버경로 제외
					uploadFileName = uploadFileInfo.getServerFileName();
					fileSize = uploadFileInfo.getSize();
					fileExtension = uploadFileInfo.getClientFileName()
							.substring(uploadFileInfo.getClientFileName().lastIndexOf(".") + 1);

					listMap = new HashMap<String, Object>();
					listMap.put("fileId", fildId);
					listMap.put("fileNumber", fileNumber);
					listMap.put("fileName", fileName);
					listMap.put("uploadFilePath", uploadFilePath);
					listMap.put("uploadFileName", uploadFileName);
					listMap.put("fileSize", fileSize);
					listMap.put("fileExtension", fileExtension);
					listMap.put("createId", userId);
					listMap.put("updateId", userId);
					
					// contents 사진 파일 저장
					fileUploadService.updateFileInfo(listMap);

				} catch (Exception e) {
					LOGGER.error("File Upload Error : " + e.getMessage());
					throw new Exception(this.getClass().getName(), e);
				}
			}
		}

		// 파일이 없을경우 contents에 file_id 초기화
		if(!fileCheck){
			input.setFileId(null);
		}
		
		// contents_info 테이블에 저장
		contentsService.updateContents(input);
		String redirectUrl = "redirect:/contents.do";
		
		return redirectUrl;
	}

	// Contents 삭제
	@RequestMapping(value = "/contents/anatomyDelete.do")
	public String deleteContents(Contents input, ModelMap model, HttpSession session) {
		
		String menuId = (String) session.getAttribute("menuId");		
		input.setMenuId(menuId);

		if (contentsService.retrieveFrontMenuId(input) != null
				&& !"".equals(contentsService.retrieveFrontMenuId(input))) {
			input.setMenuId(contentsService.retrieveFrontMenuId(input).getMenuId());
		}
		
		String userId = null;
		userId = (String) session.getAttribute("userId");
		input.setUserId(userId);
		
		contentsService.updateDeleteYnContents(input);

		String redirectUrl = "redirect:/contents.do";
		
		return redirectUrl;
	}
	
}
