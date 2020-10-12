package devonframe.gyva.front.common.filedownload.service;

import java.util.List;

import devonframe.gyva.front.common.fileupload.model.FileInfo;


public interface FileDownloadService {

    public void deleteFileInfoList(List<FileInfo> fileInfoList);
    
    public List<FileInfo> retrieveFileInfoList(FileInfo fileInfo);
    
    
}

