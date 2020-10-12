package devonframe.gyva.common.filedownload.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonframe.filedownload.view.FileDownloadView;
import devonframe.fileupload.FileUpload;
import devonframe.gyva.admin.system.log.model.Log;
import devonframe.gyva.admin.system.log.service.LogService;
import devonframe.gyva.common.filedownload.service.FileDownloadService;
import devonframe.gyva.common.fileupload.model.FileInfo;
import devonframe.gyva.common.fileupload.model.FileInfoArray;
import devonframe.util.NullUtil;

@Controller
public class FileDownloadController {
    
    @Resource(name = "logService")
    private LogService logService;

	@Resource(name = "fileUpload")
	private FileUpload fileUpload;
    
    @Resource(name="fileDownloadService") 
    private FileDownloadService fileDownloadService;
    
    @RequestMapping(value="/function/filedownload/downloadFileList.do")
    public FileDownloadView downloadFileList(FileInfoArray fileInfoArray, Log log, ModelMap model, HttpServletRequest mpRequest, HttpSession session) {
        FileDownloadView fileDownloadView = null;
        String applicationPath = mpRequest.getServletContext().getRealPath("");
        
        if(!NullUtil.isNull(fileInfoArray)) {
            List<FileInfo> fileInfoList = fileInfoArray.getCheckedFileInfoList();
            if(fileInfoList.size() == 1) {
                fileDownloadView = new FileDownloadView(applicationPath+fileInfoList.get(0).getUploadFilePath());
            } else {
                String [] uploadFilePath = new String[fileInfoList.size()];
                for(int inx=0; inx < uploadFilePath.length; inx++) {
                    uploadFilePath[inx] = applicationPath+fileInfoList.get(inx).getUploadFilePath();
                }
                fileDownloadView = new FileDownloadView(uploadFilePath,"FileDownloadArray");
            }

			if (!session.getAttribute("menuId").toString().subSequence(0, 2).equals("AD")) { 
	    		log.setUserId((String) session.getAttribute("userId").toString());
	    		
	    		if (log.getDownloadId() != null) {
	    			log.setContentsId(log.getDownloadId());
	    		}
	
	    		logService.insertLog(log);
			}
        }
        return fileDownloadView;
    }
	
}