package devonframe.gyva.admin.user.manager.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import devonframe.gyva.front.common.code.model.Code;
import devonframe.gyva.admin.user.manager.model.Manager;

@Repository
public class ManagerDao {
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static final String namespace = "manager";
	
	public Manager retrieveManager(Manager manager) {
		return sqlSession.selectOne(namespace + ".retrieveManager", manager);
	}

	public List<Manager> retrieveManagerList(Manager manager) {
		return sqlSession.selectList(namespace + ".retrieveManagerList", manager);
	}
	
	public void insertManager(Manager manager) {
		sqlSession.insert(namespace + ".insertManager", manager);
	}
	
	public void updateManager(Manager manager) {
		sqlSession.update(namespace + ".updateManager", manager);
	}

	public void deleteManager(Manager manager) {
		sqlSession.delete(namespace + ".deleteManager", manager);
	}
	
	public List<Code> retrieveCodeDetailList(Code codeDetail) {
		return sqlSession.selectList(namespace + ".retrieveCodeDetailList", codeDetail);
	}
	
	public int idChk(Manager manager) {
		return sqlSession.selectOne(namespace + ".idChk", manager);
	}
	
    public int checkUserId(Manager manager) {
    	return sqlSession.selectOne(namespace + ".checkUserId", manager);
    }

    public int checkUser(Manager manager) {
    	return sqlSession.selectOne(namespace + ".checkUser", manager);
    }
}
