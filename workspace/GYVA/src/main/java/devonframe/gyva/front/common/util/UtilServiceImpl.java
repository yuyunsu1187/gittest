package devonframe.gyva.front.common.util;

import java.util.UUID;

import org.springframework.stereotype.Service;

@Service("utilService")
public class UtilServiceImpl implements UtilService {

	
	/**
	 * 10자리 random UUID생성
	 * @param length 문자열 길이
	 * @return 랜덤문자열
	 */
	@Override
	public String getRandomUuid(int length) {
		String result = "";
		for (int i = 0; i < 5; i++) {
			String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
			uuid = uuid.substring(0, length); // uuid를 앞에서부터 10자리 잘라줌.
			result = uuid;
		}
		return result;
	}
}
