package devonframe.gyva.common.menu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.common.menu.model.Menu;
import devonframe.gyva.common.menu.service.MenuService;
import devonframe.gyva.contents.model.Contents;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Resource(name = "commonDao")
    private CommonDao commonDao;

	public void retrieveSubMenuList(Menu menu) {
		commonDao.selectList("Menu.retrieveSubMenuList", menu);
	}

	public Menu retrieveMenuIdChange(Menu menu) {
		return commonDao.select("Menu.retrieveMenuIdChange", menu);
	}
	
	public Menu retrieveReturnMenuInfo(Menu menu) {
		return commonDao.select("Menu.retrieveReturnMenuInfo", menu);
	}
	
	public List<Menu> retrieveMenuList(Menu menu) {
		List<Menu> resultList = commonDao.selectList("Menu.retrieveMenuList", menu);
		return resultList;
	}
	
	public Menu retrieveCallMenuInfo(Contents contents) {
		return commonDao.select("Menu.retrieveCallMenuInfo", contents);
	}
		
}
