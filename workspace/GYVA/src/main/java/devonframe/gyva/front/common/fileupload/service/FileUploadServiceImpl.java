package devonframe.gyva.front.common.fileupload.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;

@Service("fileUploadService")
public class FileUploadServiceImpl implements FileUploadService {
    
    @Resource(name = "commonDao")
    private CommonDao commonDao;

    @Override
	public void insertFileInfo(Map<String, Object> map){
    	   commonDao.insert("FileInfo.insertFileInfo", map);
    }
    
    @Override
	public void updateFileInfo(Map<String, Object> map){
    	   commonDao.update("FileInfo.updateFileInfo", map);
    }
}
