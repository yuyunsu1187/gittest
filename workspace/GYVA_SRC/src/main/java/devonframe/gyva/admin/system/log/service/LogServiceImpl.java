package devonframe.gyva.admin.system.log.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.admin.system.log.model.Log;

@Service("logService")
public class LogServiceImpl implements LogService{

    @Resource(name = "commonDao")
    private CommonDao commonDao;  

    public List<Log> retrieveLogList(Log log) {
        List<Log> resultList = commonDao.selectList("Log.retrieveLogList", log);
        return resultList;
    }

	@Override
	public void insertLog(Log log) {
		
		commonDao.insert("Log.insertLog", log);
		
	}

}
