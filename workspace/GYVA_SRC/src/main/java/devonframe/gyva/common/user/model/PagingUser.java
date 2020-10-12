/*
 * @(#) UserVO.java
 *
 * Copyright 2012 by LG CNS, Inc.,
 * All rights reserved.
 *
 * Do Not Erase This Comment!!! (이 주석문을 지우지 말것)
 *
 * 본 클래스를 실제 프로젝트에 사용하는 경우 이브아르 아카데미 프로젝트 담당자에게
 * 프로젝트 정식명칭, 담당자 연락처(Email)등을 mail로 알려야 한다.
 *
 * 소스를 변경하여 사용하는 경우 이브아르 아카데미 프로젝트 담당자에게
 * 변경된 소스 전체와 변경된 사항을 알려야 한다.
 * 저작자는 제공된 소스가 유용하다고 판단되는 경우 해당 사항을 반영할 수 있다.
 *
 * (주의!) 원저자의 허락없이 재배포 할 수 없으며
 * LG CNS 외부로의 유출을 하여서는 안 된다.
 */
package devonframe.gyva.common.user.model;

import devonframe.paging.model.PagingEntity;
import devonframe.security.crypto.DigestManager;

/**
 * user_info 정보
 * 본 클래스는 사용자정보를 담는 VO 클래스입니다. 
 * <pre>
 * <b>History:</b>
 *  작성자, 1.0, 20.07.21 최초작성
 * </pre>
 *
 * @author 	유윤수
 * @version 1.0, 20.07.21 소스 수정
 * @see 	None 
 * @param 
 */
public class PagingUser extends PagingEntity {
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
	private String partnerName;		// 파트너 이름
	private String consentYn;		// 동의 여부
	
	private String consent2Yn;		// 동의2 여부
	private String remark;			// 비고
	private String createId;		// 작성자
	private String createDate;		// 작성 일자
	private String updateId;		// 수정자
	
	private String updateDate;		// 수정 일자
	private String hpName;			// 병원 이름
	private String hpAdd;			// 병원 지역코드
	private String hpZipcode;		// 병원 주소
	
	private String deleteYn;		// 삭제 여부
	private String readerUserId;	// 강사 ID(seq)
	private String career1;         // 강사 경력
	private String career2;
	private String career3;

	private String lecturerImgPath; // 강사 이미지 파일 경로
	private String fileName; 		// 강사 이미지 파일명
	private String userTypeName; 	// 회원 유형 이름
	private String countryName;		// 국가 명
	private String specialName;		// 전공 명
	private String stateName;		// 요청 상태 명
	private String searchType;		// 검색 타입
	
	private String categoryCode;
	private String deviceType;		
	private String userPassword;
	
	private String[] checkList;
	
	
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
		this.email = email.toUpperCase();
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
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public String getConsentYn() {
		return consentYn;
	}
	public void setConsentYn(String consentYn) {
		this.consentYn = consentYn;
	}
	public String getConsent2Yn() {
		return consent2Yn;
	}
	public void setConsent2Yn(String consent2Yn) {
		this.consent2Yn = consent2Yn;
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
	public String getHpName() {
		return hpName;
	}
	public void setHpName(String hpName) {
		this.hpName = hpName;
	}
	public String getHpAdd() {
		return hpAdd;
	}
	public void setHpAdd(String hpAdd) {
		this.hpAdd = hpAdd;
	}
	public String getHpZipcode() {
		return hpZipcode;
	}
	public void setHpZipcode(String hpZipcode) {
		this.hpZipcode = hpZipcode;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	
	public String getReaderUserId() {
		return readerUserId;
	}
	public void setReaderUserId(String readerUserId) {
		this.readerUserId = readerUserId;
	}	
	public String getCareer1() {
		return career1;
	}
	public void setCareer1(String career1) {
		this.career1 = career1;
	}
	public String getCareer2() {
		return career2;
	}
	public void setCareer2(String career2) {
		this.career2 = career2;
	}
	public String getCareer3() {
		return career3;
	}
	public void setCareer3(String career3) {
		this.career3 = career3;
	}
	public String getLecturerImgPath() {
		return lecturerImgPath;
	}
	public void setLecturerImgPath(String lecturerImgPath) {
		this.lecturerImgPath = lecturerImgPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUserTypeName() {
		return userTypeName;
	}
	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getSpecialName() {
		return specialName;
	}
	public void setSpecialName(String specialName) {
		this.specialName = specialName;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String[] getCheckList() {
		return checkList;
	}
	public void setCheckList(String[] checkList) {
		this.checkList = checkList;
	}
	public String getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	@Override
	public String toString() {
		return "User [seq=" + seq + ", email=" + email + ", password=" + password + ", nameFirst=" + nameFirst
				+ ", nameLast=" + nameLast + ", userType=" + userType + ", specialCode=" + specialCode
				+ ", countryCode=" + countryCode + ", fileId=" + fileId + ", requestDate=" + requestDate
				+ ", confirmId=" + confirmId + ", confirmDate=" + confirmDate + ", stateCode=" + stateCode
				+ ", partnerName=" + partnerName + ", consentYn=" + consentYn +", consent2Yn=" + consent2Yn + ", remark=" + remark + ", createId="
				+ createId + ", createDate=" + createDate + ", updateId=" + updateId + ", updateDate=" + updateDate
				+ ", hpName=" + hpName + ", hpAdd=" + hpAdd + ", hpZipcode=" + hpZipcode + ", deleteYn=" + deleteYn
				+ ", readerUserId=" + readerUserId + ", career1=" + career1 + ", career2=" + career2 + ", career3="
				+ career3 + ", lecturerImgPath=" + lecturerImgPath + ", userTypeName=" + userTypeName 
				+ ", countryName=" + countryName + ", specialName=" + specialName + ", stateName=" + stateName 
				+ ", searchType=" + searchType + ", checkList=" + checkList + "]";
	}
	
}
