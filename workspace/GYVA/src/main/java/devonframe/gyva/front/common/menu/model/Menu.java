package devonframe.gyva.front.common.menu.model;


public class Menu {
    
    private String menuId;
    
    private String  menuName;
    
    private int menuLevel;
    
    private String parentMenuId;
    
    private String menuUrl;

    private String userId;
    
    private String contentsId;

    
    public String getMenuId() {
        return menuId;
    }    
    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }
    
    public String getMenuName() {
        return menuName;
    }    
    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }
    
    public int getMenuLevel() {
        return menuLevel;
    }    
    public void setMenuLevel(int menuLevel) {
        this.menuLevel = menuLevel;
    }
    
    public String getParentMenuId() {
        return parentMenuId;
    }    
    public void setParentMenuId(String parentMenuId) {
        this.parentMenuId = parentMenuId;
    }
    
    public String getMenuUrl() {
        return menuUrl;
    }    
    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }
    
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getContentsId() {
		return contentsId;
	}
	public void setContentsId(String contentsId) {
		this.contentsId = contentsId;
	}
}
