package devonframe.gyva.common.fileupload.model;



public class FileInfo {
	
	String fileId = "";
	
	String fileNumber = "";
    
    String fileName ="";
    
    String uploadFilePath = "";
    
    long fileSize = 0;
    
    String fileExtension = "";

	String menuId;
	
	String contentsId;
	
	String categoryCode;
	
	String applicationPath;
    
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

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getContentsId() {
		return contentsId;
	}

	public void setContentsId(String contentsId) {
		this.contentsId = contentsId;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getApplicationPath() {
		return applicationPath;
	}

	public void setApplicationPath(String applicationPath) {
		this.applicationPath = applicationPath;
	}

	@Override
	public String toString() {
		return "FileInfo [fileId=" + fileId + ", fileNumber=" + fileNumber + ", fileName=" + fileName
				+ ", uploadFilePath=" + uploadFilePath + ", fileSize=" + fileSize + ", fileExtension=" + fileExtension  
				+ ", applicationPath=" + applicationPath 
				+ "]";
	}

}
