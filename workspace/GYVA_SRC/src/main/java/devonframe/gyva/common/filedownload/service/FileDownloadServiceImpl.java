package devonframe.gyva.common.filedownload.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.common.fileupload.model.FileInfo;
import devonframe.util.FileUtil;

@Service("fileDownloadService")
public class FileDownloadServiceImpl implements FileDownloadService {
    
    @Resource(name = "commonDao")
    private CommonDao commonDao;

    @Override
	public void deleteFileInfoList(List<FileInfo> fileInfoList) {
        for(FileInfo fileInfo : fileInfoList) {
            commonDao.delete("FileInfo.deleteFileInfo", fileInfo);
            FileUtil.deleteFile(fileInfo.getUploadFilePath());
        }
    }

    @Override
	public List<FileInfo> retrieveFileInfoList(FileInfo fileInfo) {
        return commonDao.selectList("FileInfo.retrieveFileInfoList", fileInfo);
    }
}
