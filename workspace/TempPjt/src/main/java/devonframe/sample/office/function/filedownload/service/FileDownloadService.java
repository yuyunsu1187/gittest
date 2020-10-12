package devonframe.sample.office.function.filedownload.service;

import java.util.List;

import devonframe.sample.office.function.filedownload.model.FileInfo;


public interface FileDownloadService {

    public void deleteFileInfoList(List<FileInfo> fileInfoList);
    
    public List<FileInfo> retrieveFileInfoList(FileInfo fileInfo);
    
    
}

