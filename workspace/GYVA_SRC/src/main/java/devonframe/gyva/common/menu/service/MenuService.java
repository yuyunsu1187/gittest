package devonframe.gyva.common.menu.service;

import java.util.List;

import devonframe.gyva.common.menu.model.Menu;
import devonframe.gyva.contents.model.Contents;

public interface MenuService {

	public void retrieveSubMenuList(Menu menu);
	public Menu retrieveMenuIdChange(Menu menu);
	public Menu retrieveReturnMenuInfo(Menu menu);
	public List<Menu> retrieveMenuList(Menu menu);

	public Menu retrieveCallMenuInfo(Contents contents);
	
}