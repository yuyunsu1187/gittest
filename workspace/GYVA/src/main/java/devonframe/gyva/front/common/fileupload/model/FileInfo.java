package devonframe.gyva.front.common.fileupload.model;



public class FileInfo {
	
	String fileId = "";
	
	String fileNumber = "";
    
    String fileName ="";
    
    String uploadFilePath = "";
    
    long fileSize = 0;
    
    String fileExtension = "";
    
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileNumber() {
		return fileNumber;
	}

	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUploadFilePath() {
		return uploadFilePath;
	}

	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileExtension() {
		return fileExtension;
	}

	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}

	@Override
	public String toString() {
		return "FileInfo [fileId=" + fileId + ", fileNumber=" + fileNumber + ", fileName=" + fileName
				+ ", uploadFilePath=" + uploadFilePath + ", fileSize=" + fileSize + ", fileExtension=" + fileExtension
				+ "]";
	}

}