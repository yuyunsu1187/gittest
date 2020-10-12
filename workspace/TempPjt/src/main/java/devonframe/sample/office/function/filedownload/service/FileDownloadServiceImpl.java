package devonframe.sample.office.function.filedownload.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.sample.office.function.filedownload.model.FileInfo;
import devonframe.util.FileUtil;

@Service("fileDownloadService")
public class FileDownloadServiceImpl implements FileDownloadService {
    
    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public void deleteFileInfoList(List<FileInfo> fileInfoList) {
        for(FileInfo fileInfo : fileInfoList) {
            commonDao.delete("FileInfo.deleteFileInfo", fileInfo);
            FileUtil.deleteFile(fileInfo.getUploadFilePath());
        }
    }

    public List<FileInfo> retrieveFileInfoList(FileInfo fileInfo) {
        return commonDao.selectList("FileInfo.retrieveFileInfoList", fileInfo);
    }
}
