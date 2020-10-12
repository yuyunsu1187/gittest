package devonframe.gyva.common.user.dao;


import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import devonframe.gyva.common.user.model.User;
import devonframe.gyva.contents.model.Contents;

@Repository
public class UserDao {
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static final String namespace = "User";
	
	public User retrieveUser(User User) {
		return sqlSession.selectOne(namespace + ".retrieveUser", User);
	}

	public List<User> retrieveUserList(User User) {
		return sqlSession.selectList(namespace + ".retrieveUserList", User);
	}
	
	public List<User> retrieveLecturerList(Contents contents) {
		return sqlSession.selectList(namespace+ ".retrieveLecturerList", contents);
	}
	
	public User retrieveLecturer(User user) {
		return sqlSession.selectOne(namespace+ ".retrieveLecturerList", user);
	}
	
	// 회원 가입 저장
	public void insertUser(User user) {
		sqlSession.insert(namespace + ".insertUser", user);
	}
	
	public void updateUser(User User) {
		sqlSession.update(namespace + ".updateUser", User);
	}
	public void updateUserLecturer(User User) {
		sqlSession.update(namespace + ".updateUserLecturer", User);
	}

	public void deleteUser(User User) {
		sqlSession.delete(namespace + ".deleteUser", User);
	}

	public void updatePwdUser(User User) {
		sqlSession.update(namespace + ".updatePwdUser", User);
	}
	
	public int idChk(User User) {
		return sqlSession.selectOne(namespace + ".idChk", User);
	}
	
	public void updateLecturer(User User) {
		sqlSession.update(namespace + ".updateLecturer", User);
	}
	
	public void updateUserType(User User) {
		sqlSession.update(namespace + ".updateUserType", User);
	}
	
	public void deleteUserList(User User) {
		sqlSession.update(namespace + ".deleteUserList", User);
	}	
	// 강사 정보 신규 저장
	public void insertLecturer(User user) {
		sqlSession.insert(namespace + ".insertLecturer", user);
	}
	
}
