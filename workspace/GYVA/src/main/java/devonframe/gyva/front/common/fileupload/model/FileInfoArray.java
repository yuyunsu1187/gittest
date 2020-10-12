package devonframe.gyva.front.common.fileupload.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import devonframe.gyva.front.common.fileupload.model.FileInfo;


public class FileInfoArray {
    
    
    private String[] checkIndex;
    private String[] fileName;
    private String[] uploadFilePath;
    
    public int size() {
        return fileName.length;
    }
    
    public FileInfo getFileInfo(int index) {
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName(fileName[index]);
        fileInfo.setUploadFilePath(uploadFilePath[index]);
        return fileInfo;
    }
    
    public List<FileInfo> getFileInfoList() {
        List<FileInfo> fileInfoList = new ArrayList<FileInfo>();
        for (int inx = 0; inx < this.size(); inx++) {
            fileInfoList.add(getFileInfo(inx));
        }
        
        return fileInfoList;
    }
    
    public List<FileInfo> getCheckedFileInfoList() {
        List<FileInfo> fileInfoList = new ArrayList<FileInfo>();
        for (int inx = 0; inx < this.checkIndex.length; inx++) {
            fileInfoList.add(getFileInfo(Integer.parseInt(checkIndex[inx])));
        }
        
        return fileInfoList;
    }
    
    public String[] getCheckIndex() {
        return checkIndex;
    }

    
    public void setCheckIndex(String[] checkIndex) {
        this.checkIndex = checkIndex;
    }

    
    public String[] getFileName() {
        return fileName;
    }

    
    public void setFileName(String[] fileName) {
        this.fileName = fileName;
    }

    
    public String[] getUploadFilePath() {
        return uploadFilePath;
    }

    
    public void setUploadFilePath(String[] uploadFilePath) {
        this.uploadFilePath = uploadFilePath;
    }

	@Override
	public String toString() {
		return "FileInfoArray [checkIndex=" + Arrays.toString(checkIndex) + ", fileName=" + Arrays.toString(fileName)
				+ ", uploadFilePath=" + Arrays.toString(uploadFilePath) + "]";
	}
    

}
