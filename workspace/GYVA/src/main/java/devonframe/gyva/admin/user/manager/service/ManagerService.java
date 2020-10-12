package devonframe.gyva.admin.user.manager.service;

import java.util.List;

import devonframe.gyva.front.common.code.model.Code;
import devonframe.gyva.admin.user.manager.model.Manager;

public interface ManagerService {

	public Manager retrieveManager(Manager manager);
	public List<Manager> retrieveManagerList(Manager manager);
	
	public void insertManager(Manager manager);
	public void updateManager(Manager manager);
	public void deleteManager(Manager manager);
	
	public List<Code> retrieveCodeDetailList(Code codeDetail);

	public int idChk(Manager manager);
	public boolean checkUserId(Manager manager);
    public boolean checkUser(Manager manager);

}
