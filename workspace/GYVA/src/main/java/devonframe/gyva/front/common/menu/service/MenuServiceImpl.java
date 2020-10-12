package devonframe.gyva.front.common.menu.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.front.common.menu.model.Menu;
import devonframe.gyva.front.common.menu.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Resource(name = "commonDao")
    private CommonDao commonDao;

	@Override
	public void insertLog(Menu menu) {
		
		commonDao.insert("Menu.insertLog", menu);
		
	}
	
	@Override
	public void retrieveMenuList(Menu menu) {
		commonDao.selectList("Menu.retrieveMenuList", menu);
	}
}
