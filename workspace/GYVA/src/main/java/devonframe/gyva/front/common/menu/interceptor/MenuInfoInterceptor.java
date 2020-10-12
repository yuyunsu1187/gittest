/*
 * Copyright ⓒ LG CNS, Inc. All rights reserved.
 *
 * Do Not Erase This Comment!!! (이 주석문을 지우지 말것)
 *
 * DevOn Framework의 클래스를 실제 프로젝트에 사용하는 경우 DevOn Framework 개발담당자에게
 * 프로젝트 정식명칭, 담당자 연락처(Email)등을 mail로 알려야 한다.
 *
 * 소스를 변경하여 사용하는 경우 DevOn Framework 개발담당자에게
 * 변경된 소스 전체와 변경된 사항을 알려야 한다.
 * 저작자는 제공된 소스가 유용하다고 판단되는 경우 해당 사항을 반영할 수 있다.
 *
 * (주의!) 원저자의 허락없이 재배포 할 수 없으며 LG CNS 외부로의 유출을 하여서는 안 된다.
 */
package devonframe.gyva.front.common.menu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import devonframe.web.servlet.handler.UrlPatternInterceptorAdapter;

/**
 *
 *
 * @author DevOn Framework, LG CNS,Inc., devon@lgcns.com
 * @version DevOnFrame 1.0.0
 * @since DevOnFrame 1.0.0
 */
public class MenuInfoInterceptor extends UrlPatternInterceptorAdapter {

    @Override
    public boolean checkHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	HttpSession session = request.getSession(true);

    	String menuId = null;
    	String mainMenuId = null;
    	String parentMenuId = null;
    	String mainType = null;
    	
    	if(request.getParameter("menuId") != null){
    		menuId = request.getParameter("menuId");
    		mainMenuId = request.getParameter("menuId").substring(0,6);
    		parentMenuId = request.getParameter("menuId").substring(0,4);
    		mainType = request.getParameter("menuId").substring(0,2);
    		
    		session.removeAttribute("MenuInfoInterceptor_menuId");
    		session.removeAttribute("MenuInfoInterceptor_mainMenuId");
    		session.removeAttribute("MenuInfoInterceptor_parentMenuId");
    		session.removeAttribute("MenuInfoInterceptor_mainType");
    	} else {
    		menuId = (String) session.getAttribute("MenuInfoInterceptor_menuId");
    		parentMenuId = (String) session.getAttribute("MenuInfoInterceptor_mainMenuId");
    		parentMenuId = (String) session.getAttribute("MenuInfoInterceptor_parentMenuId");
    		mainType = (String) session.getAttribute("MenuInfoInterceptor_mainType");
    	} 

    	session.setAttribute("MenuInfoInterceptor_menuId", menuId);
    	session.setAttribute("MenuInfoInterceptor_mainMenuId", mainMenuId);
    	session.setAttribute("MenuInfoInterceptor_parentMenuId", parentMenuId);
    	session.setAttribute("MenuInfoInterceptor_mainType", mainType);
		 
        return true;
    }

}
