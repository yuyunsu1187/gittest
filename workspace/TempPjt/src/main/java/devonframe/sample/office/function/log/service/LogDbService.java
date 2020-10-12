package devonframe.sample.office.function.log.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import devonframe.sample.office.function.log.model.LogDb;


public interface LogDbService {

    @Transactional(readOnly = true)
    public List<LogDb> retrieveLogDbList(LogDb logDb);

}

