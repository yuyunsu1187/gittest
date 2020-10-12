package devonframe.gyva.common.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.common.user.dao.UserDao;
import devonframe.gyva.common.user.model.User;
import devonframe.gyva.contents.model.Contents;
import devonframe.paging.model.PagingEntity;

/**
 * <pre>
 * 본 클래스는 사용자 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "userDao")
	private UserDao userDao;
	
    @Resource(name="commonDao")
    private CommonDao commonDao;

	@Override
	public User retrieveUser(User user) {
		return userDao.retrieveUser(user);
	}

	// 회원 리스트 조회
	@Override
	public List<User> retrieveUserList(User user) {
		List<User> resultList = userDao.retrieveUserList(user);
		return resultList;
	}
	
    public List<User> retrieveUserPagedList(PagingEntity user) {
        List<User> resultList = commonDao.selectPagedList("User.retrieveUserList", user);
        return resultList;
    }
	
	// 강사 리스트 조회
	@Override
	public List<User> retrieveLecturerList(Contents contents) {
		List<User> resultList = userDao.retrieveLecturerList(contents);
		return resultList;
	}
	
	// 강사 조회
	@Override
	public User retrieveLecturer(User user) {
		return userDao.retrieveLecturer(user);
	}

	// 회원 가입 정보 저장
	@Override
	public void insertUser(User user) {
		userDao.insertUser(user);
	}
	
	// 회원 정보 수정
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	
	// 회원 정보 수정(암호 초기화)
	public void updateUserPassword(User user) {
		commonDao.update("updateUserPassword", user);
	}
	// 회원 정보 수정
	@Override
	public void updateUserLecturer(User user) {
		userDao.updateUserLecturer(user);
	}
	
	// 회원 정보 삭제
	@Override
	public void deleteUser(User user) {
		userDao.deleteUser(user);
	}
	
	// 회원 비밀번호 수정
	@Override
	public void resetPwdUser(User user) {
		userDao.updatePwdUser(user);
	}

	// 아이디 중복체크
	@Override
	public int idChk(User user) {
		int result = userDao.idChk(user);
		return result;
	}
	
	// 강사 정보 수정
	@Override
	public void updateLecturer(User user) {
		userDao.updateLecturer(user);
	}
	
	// 회원 타입 수정
	@Override
	public void updateUserType(User user) {
		userDao.updateUserType(user);
	}
	
	// 회원 가입 정보 저장
	@Override
	public void insertLecturer(User user) {
		userDao.insertLecturer(user);
	}
	
}
