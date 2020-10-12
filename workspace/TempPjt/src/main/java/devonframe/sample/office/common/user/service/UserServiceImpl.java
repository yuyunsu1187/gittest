package devonframe.sample.office.common.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.sample.office.common.user.model.User;

/**
 * <pre>
 * 본 클래스는 사용자 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "commonDao")
	private CommonDao commonDao;

	public User retrieveUser(User user) {
		return commonDao.select("User.retrieveUser", user);
	}

	public List<User> retrieveUserList(User user) {
		List<User> resultList = commonDao.selectList("User.retrieveUserList", user);
		return resultList;
	}

	public void insertUser(User user) {
	    commonDao.insert("User.insertUser", user);
	}

	public void updateUser(User user) {
	    commonDao.update("User.updateUser", user);
	}

	public void deleteUser(User user) {
	    commonDao.delete("User.deleteUser", user);
	}

}
