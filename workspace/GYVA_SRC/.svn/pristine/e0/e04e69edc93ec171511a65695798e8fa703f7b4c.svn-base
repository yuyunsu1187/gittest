package devonframe.gyva.admin.user.manager.model;

import devonframe.security.crypto.DigestManager;

/**
 * user_info 정보
 * 본 클래스는 사용자정보를 담는 VO 클래스입니다. 
 * <pre>
 * <b>History:</b>
 *  작성자, 1.0, 20.07.30 최초작성
 * </pre>
 *
 * @author 	곽동현
 * @version 1.0, 20.07.30 소스 수정
 * @see 	None 
 * @param 
 */
public class Manager {

	private String seq;				// 순번
	private String email;			// 이메일(ID)
	private String password;		// 비밀번호
	private String nameFirst;		// 이름(영문)
	private String nameLast;		// 성(영문)
	
	private String userType;		// 회원 유형
	private String specialCode;		// 전공의 코드
	private String countryCode;		// 국가 코드
	private String fileId;			// 파일 아이디
	private String requestDate;		// 가입 요청 일자
	
	private String confirmId;		// 승인자
	private String confirmDate;		// 승인 일자
	private String stateCode;		// 상태 코드
	private String consentYn;		// 동의 여부
	private String deleteYn;		// 삭제여부
	private String remark;			// 비고
	
	private String createId;		// 작성자
	private String createDate;		// 작성 일자
	private String updateId;		// 수정자
	private String updateDate;		// 수정 일자
	
	private String description;     // 코드 설명
	private String userTypeName;    // 유저 타입 명
	private String searchType;		// 검색 타입
	private String codeName;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = DigestManager.digest(password, "SHA-512");;
	}
	public String getNameFirst() {
		return nameFirst;
	}
	public void setNameFirst(String nameFirst) {
		this.nameFirst = nameFirst.toUpperCase();
	}
	public String getNameLast() {
		return nameLast;
	}
	public void setNameLast(String nameLast) {
		this.nameLast = nameLast.toUpperCase();
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public String getSpecialCode() {
		return specialCode;
	}
	public void setSpecialCode(String specialCode) {
		this.specialCode = specialCode;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getConfirmId() {
		return confirmId;
	}
	public void setConfirmId(String confirmId) {
		this.confirmId = confirmId;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	public String getConsentYn() {
		return consentYn;
	}
	public void setConsentYn(String consentYn) {
		this.consentYn = consentYn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCreateId() {
		return createId;
	}
	public void setCreateId(String createId) {
		this.createId = createId;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getUserTypeName() {
		return userTypeName;
	}
	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Manager [seq=");
		builder.append(seq);
		builder.append(", email=");
		builder.append(email);
		builder.append(", password=");
		builder.append(password);
		builder.append(", nameFirst=");
		builder.append(nameFirst);
		builder.append(", nameLast=");
		builder.append(nameLast);
		builder.append(", userType=");
		builder.append(userType);
		builder.append(", specialCode=");
		builder.append(specialCode);
		builder.append(", countryCode=");
		builder.append(countryCode);
		builder.append(", fileId=");
		builder.append(fileId);
		builder.append(", requestDate=");
		builder.append(requestDate);
		builder.append(", confirmId=");
		builder.append(confirmId);
		builder.append(", confirmDate=");
		builder.append(confirmDate);
		builder.append(", stateCode=");
		builder.append(stateCode);
		builder.append(", consentYn=");
		builder.append(consentYn);
		builder.append(", deleteYn=");
		builder.append(deleteYn);
		builder.append(", remark=");
		builder.append(remark);
		builder.append(", createId=");
		builder.append(createId);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", updateId=");
		builder.append(updateId);
		builder.append(", updateDate=");
		builder.append(updateDate);
		builder.append(", description=");
		builder.append(description);
		builder.append(", userTypeName=");
		builder.append(userTypeName);
		builder.append(", searchType=");
		builder.append(searchType);
		builder.append(", codeName=");
		builder.append(codeName);
		builder.append("]");
		return builder.toString();
	}
	
}