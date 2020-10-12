package devonframe.gyva.front.common.filedownload.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.filedownload.view.FileDownloadView;
import devonframe.fileupload.FileUpload;
import devonframe.gyva.front.common.filedownload.service.FileDownloadService;
import devonframe.gyva.front.common.fileupload.model.FileInfo;
import devonframe.gyva.front.common.fileupload.model.FileInfoArray;
import devonframe.util.NullUtil;

@Controller
public class FileDownloadController {

	@Resource(name = "fileUpload")
	private FileUpload fileUpload;
    
    @Resource(name="fileDownloadService") 
    private FileDownloadService fileDownloadService;
    
    @RequestMapping(value="/function/filedownload/retrieveFileDownloadList.do")
    public String retrieveFileDownloadlist(String fileName, String uploadDate, ModelMap model) {
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName(fileName);

        model.addAttribute("resultList", fileDownloadService.retrieveFileInfoList(fileInfo));
        model.addAttribute("input", fileInfo);
        return "function/filedownload/fileDownloadList";
    }
    
    @RequestMapping(value="/function/filedownload/deleteFileList.do")
    public String deleteFileList(FileInfoArray fileInfoArray,String searchFileName, String searchUploadDate, ModelMap model) {
        
        fileDownloadService.deleteFileInfoList(fileInfoArray.getCheckedFileInfoList());
        
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName(searchFileName);
        model.addAttribute("input", fileInfo);
        return "function/filedownload/fileDownloadList";
    }
    
    @RequestMapping(value="/function/filedownload/downloadFileList.do")
    public FileDownloadView downloadFileList(FileInfoArray fileInfoArray, ModelMap model) {
    	System.out.println("########### FileDownloadView");
        FileDownloadView fileDownloadView = null;
        
        if(!NullUtil.isNull(fileInfoArray)) {
            List<FileInfo> fileInfoList = fileInfoArray.getCheckedFileInfoList();
            if(fileInfoList.size() == 1) {
                fileDownloadView = new FileDownloadView(fileInfoList.get(0).getUploadFilePath());
            } else {
                String [] uploadFilePath = new String[fileInfoList.size()];
                for(int inx=0; inx < uploadFilePath.length; inx++) {
                    uploadFilePath[inx] = fileInfoList.get(inx).getUploadFilePath();
                }
                fileDownloadView = new FileDownloadView(uploadFilePath,"FileDownloadArray");
            }
        }
        return fileDownloadView;
    }
    
    // Test 용 controller file_id 값으로 파일 리스트 검색
	@RequestMapping(value = "/function/filedownload/retrieveFileList.do")
	public String retrieveFileList(String fileName, ModelMap model) {
		System.out.println("########### retrieveFileList");
		
		FileInfo fileInfo = new FileInfo();
		fileInfo.setFileName(fileName);
		
		model.addAttribute("resultList", fileDownloadService.retrieveFileInfoList(fileInfo));
		model.addAttribute("input", fileInfo);
		
		return "common/fileDownload";
	}
    
    // 회원 파일 정보 노출 페이지
	@RequestMapping(value="/common/fileDownload.do")
	public String fileDownload(String fileName, String uploadDate, ModelMap model) {
		System.out.println("\t\t\t ################################# fileDownload ");
		return "common/fileDownload";
	}
	
}