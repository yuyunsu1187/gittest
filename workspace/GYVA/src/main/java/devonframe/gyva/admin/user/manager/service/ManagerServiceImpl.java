package devonframe.gyva.admin.user.manager.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.gyva.admin.user.manager.dao.ManagerDao;
import devonframe.gyva.front.common.code.model.Code;
import devonframe.gyva.admin.user.manager.model.Manager;


/**
 * <pre>
 * 관리자 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스
 * </pre>
 *
 * @author XXX팀 OOO
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	@Resource(name = "managerDao")
	private ManagerDao managerDao;

	@Override
	public Manager retrieveManager(Manager manager) {
		return managerDao.retrieveManager(manager);
	}

	@Override
	public List<Manager> retrieveManagerList(Manager manager) {
		List<Manager> resultList = managerDao.retrieveManagerList(manager);
		return resultList;
	}
	
	// 회원 가입
	@Override
	public void insertManager(Manager manager) {
		managerDao.insertManager(manager);
	}
	
	// 회원 정보 수정
	@Override
	public void updateManager(Manager manager) {
		managerDao.updateManager(manager);
	}
	
	// 삭제
	@Override
	public void deleteManager(Manager manager) {
		managerDao.deleteManager(manager);
	}
	
	public List<Code> retrieveCodeDetailList(Code codeDetail) {
		List<Code> resultList = managerDao.retrieveCodeDetailList(codeDetail);
		return resultList;
	}
	
	public int idChk(Manager manager) {
		int result = managerDao.idChk(manager);
		return result;
	}
	
	@Override
    public boolean checkUserId(Manager manager) {
        int count = managerDao.checkUserId(manager);
        return count == 1;
    }

	@Override
    public boolean checkUser(Manager manager) {
        int count = managerDao.checkUser(manager);
        return count == 1;
    }
}
