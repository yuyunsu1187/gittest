package devonframe.gyva.common.user.service;

import java.util.List;

import devonframe.gyva.common.user.model.User;
import devonframe.gyva.contents.model.Contents;
import devonframe.paging.model.PagingEntity;

/**
 * <pre>
 * 본 클래스는 사용자 정보에 대한 CRUD를 담당하는 Service 인터페이스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public interface UserService {

	public User retrieveUser(User user);
	public List<User> retrieveUserList(User user);
	
	public void insertUser(User user);
	public void updateUser(User user);
	public void updateUserPassword(User user);
	public void updateUserLecturer(User user);
	public void deleteUser(User user);
	public void resetPwdUser(User user);
	
	// 아이디 중복체크
	public int idChk(User user);
	
	// 강사 리스트 조회
	public List<User> retrieveLecturerList(Contents contents);
	public User retrieveLecturer(User user);
	public List<User> retrieveUserPagedList(PagingEntity user);
	public void updateLecturer(User user);
	public void updateUserType(User user);
	public void insertLecturer(User user);
	
}
