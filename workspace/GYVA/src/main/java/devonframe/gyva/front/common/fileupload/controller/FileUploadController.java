package devonframe.gyva.front.common.fileupload.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.fileupload.FileUpload;
import devonframe.gyva.front.common.fileupload.model.FileInfo;
import devonframe.gyva.front.common.fileupload.service.FileUploadService;

@Controller
public class FileUploadController {
    
    @Resource(name = "fileUpload")
    private FileUpload fileUpload;
	
    @Resource(name="fileUploadService") 
    private FileUploadService fileUploadService;
    
    
    // 초기화 호출용 controller 페이지 
    @RequestMapping(value="/function/fileupload/fileUploadForm.do")
    public String fileUploadForm(ModelMap model) {
        model.addAttribute("fileInfo", new FileInfo());
        return "function/fileupload/fileUploadForm";
    }
    
    /*@RequestMapping(value="/common/login/insertFileInfo.do")
    public String insertFileInfo(MultipartFile uploadFile, ModelMap model) {
    	System.out.println("\t\t\t ################################# insertFileInfo start");
    	System.out.println("uploadFile:::"+uploadFile.getSize());
        
        FileInfo fileInfo = new FileInfo();
        UploadFileInfo uploadFileInfo = fileUpload.upload(uploadFile);

        fileInfo.setFileName(uploadFileInfo.getClientFileName());
        fileInfo.setUploadFilePath(uploadFileInfo.getServerPath());
        fileInfo.setUploadFileName(uploadFileInfo.getServerFileName());
        fileInfo.setFileSize(uploadFileInfo.getSize());
        fileInfo.setUploadDate(DateUtil.getDate("yyyyMMdd"));
        
        fileUploadService.insertFileInfo(fileInfo);
        SayMessage.setMessage("성공적으로 저장하였습니다.");
        
        model.addAttribute("fileInfo", fileInfo);
        System.out.println("\t\t\t ################################# insertFileInfo e n d");
        return "/common/login/joinForm";
    }*/
}

