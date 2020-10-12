/*
 * @(#) AuthCheckInterceptor.java
 *
 * Copyright 2012 by LG CNS, Inc.,
 * All rights reserved.
 *
 * Do Not Erase This Comment!!! (이 주석문을 지우지 말것)
 *
 * 본 클래스를 실제 프로젝트에 사용하는 경우 이브아르 아카데미 프로젝트 담당자에게
 * 프로젝트 정식명칭, 담당자 연락처(Email)등을 mail로 알려야 한다.
 *
 * 소스를 변경하여 사용하는 경우 이브아르 아카데미 프로젝트 담당자에게
 * 변경된 소스 전체와 변경된 사항을 알려야 한다.
 * 저작자는 제공된 소스가 유용하다고 판단되는 경우 해당 사항을 반영할 수 있다.
 *
 * (주의!) 원저자의 허락없이 재배포 할 수 없으며
 * LG CNS 외부로의 유출을 하여서는 안 된다.
 */
package devonframe.gyva.front.common.auth.interceptor;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.support.MessageSourceAccessor;

import devonframe.gyva.front.common.handler.LHandlerInterceptorAdapter;
import devonframe.gyva.front.common.user.model.User;

/**
 * <pre>
 * 본 클래스는 관리자 권한을 체크하는 Interceptor 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public class AuthCheckInterceptor extends LHandlerInterceptorAdapter{

	@Resource(name="messageSourceAccessor")
	private MessageSourceAccessor messageSourceAccessor;

    @Override
	public boolean checkHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		User loginUser = (User) request.getSession().getAttribute("loginUser");		
		if (loginUser == null || !"00001".equals(loginUser.getUserType())) {
			if(request.getServletPath().startsWith("/system")) {

				sendErrorPage(request, response);
				return false;
			}
		}

        return true;
    }

	private void sendErrorPage(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String ajaxMode = request.getParameter("devonopen_ajax_mode");
		String errorMessage = messageSourceAccessor.getMessage("common.message.noAuth", new Object[]{request.getServletPath()});
		if(!"true".equals(ajaxMode)) {
			throw new RuntimeException(errorMessage);

		}else{
			response.setContentType("text/json");
			response.getWriter().write("{\"resultCode\":\"error\", \"resultMessage\":\""+errorMessage+"\"}");
		}
	}
}
