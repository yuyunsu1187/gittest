package devonframe.gyva.admin.user.manager.service;

import java.util.List;

import devonframe.gyva.admin.system.code.model.Code;
import devonframe.gyva.admin.user.manager.model.Manager;
import devonframe.paging.model.PagingEntity;

public interface ManagerService {

	public Manager retrieveManager(Manager manager);
	public List<Manager> retrieveManagerList(Manager manager);
	public List<Manager> retrieveManagerPagedList(PagingEntity manager);
	
	
	public void insertManager(Manager manager);
	public void updateManager(Manager manager);
	public void deleteManager(Manager manager);
	
	public List<Code> retrieveCodeDetailList(Code codeDetail);

	public int idChk(Manager manager);
	public boolean checkUserId(Manager manager);
    public boolean checkUser(Manager manager);
    public void updateUserType(Manager manager);

}
