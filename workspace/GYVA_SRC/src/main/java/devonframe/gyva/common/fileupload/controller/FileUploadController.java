package devonframe.gyva.common.fileupload.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.fileupload.FileUpload;
import devonframe.gyva.common.fileupload.model.FileInfo;
import devonframe.gyva.common.fileupload.service.FileUploadService;

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
    
}

