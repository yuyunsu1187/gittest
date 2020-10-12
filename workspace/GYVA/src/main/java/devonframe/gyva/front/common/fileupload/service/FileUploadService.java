package devonframe.gyva.front.common.fileupload.service;

import java.util.Map;


public interface FileUploadService {

    // 첨부파일 업로드
 	public void insertFileInfo(Map<String, Object> map);
 	public void updateFileInfo(Map<String, Object> map);
}
