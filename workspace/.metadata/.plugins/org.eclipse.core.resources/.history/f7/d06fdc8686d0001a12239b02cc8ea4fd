package devonframe.sample.office.function.fileupload.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.sample.office.function.fileupload.model.FileInfo;

@Service("fileUploadService")
public class FileUploadServiceImpl implements FileUploadService {
    
    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public void insertFileInfo(FileInfo fileInfo) {
        commonDao.insert("FileInfo.insertFileInfo", fileInfo);
    }

}
