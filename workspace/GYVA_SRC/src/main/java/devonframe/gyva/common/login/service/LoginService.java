package devonframe.gyva.common.login.service;

import devonframe.gyva.common.user.model.User;

/**
 * <pre>
 * 본 클래스는 로그인 처리를 담당하는 Service 인터페이스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public interface LoginService {

    public boolean checkUserId(User user);
    
    public boolean checkConfirmUserId(User user);

    public boolean checkUser(User user);

}
