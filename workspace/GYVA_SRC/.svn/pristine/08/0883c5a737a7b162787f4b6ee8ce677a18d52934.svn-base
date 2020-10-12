package devonframe.gyva.admin.contents.survey.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.admin.contents.survey.model.Survey;
import devonframe.gyva.admin.contents.survey.model.SurveyForExcel;
import devonframe.paging.model.PagingEntity;

@Service("surveyService")
public class SurveyServiceImpl implements SurveyService{

    @Resource(name = "commonDao")
    private CommonDao commonDao;  

    public List<Survey> retrieveQuestionPagedList(PagingEntity survey) {
        List<Survey> resultList = commonDao.selectPagedList("Survey.retrieveQuestionList", survey);
        return resultList;
    }
    public List<Survey> retrieveResultPagedList(PagingEntity survey) {
        List<Survey> resultList = commonDao.selectPagedList("Survey.retrieveResultList", survey);
        return resultList;
    }    

    public String retrieveSurveyId(String name) {
    	String surveyId = commonDao.select("Survey.retrieveSurveyId", name);
    	return surveyId;
    }
    
    // Question 저장
 	public void insertQuestionInfo(Survey survey) {
 		commonDao.insert("Survey.insertQuestionInfo", survey);
 	}   
 	// Question 수정
 	public void updateQuestionInfo(Survey survey) {
 		commonDao.update("Survey.updateQuestionInfo", survey);
 	} 
    
    // Result 저장
 	public void insertSurveyResult(Survey survey) {
 		commonDao.insert("Survey.insertSurveyResult", survey);
 	}    
 	// Result 수정
 	public void updateSurveyResult(Survey survey) {
  		commonDao.update("Survey.updateSurveyResult", survey);
 	} 
    
    public Survey retrieveQuestionInfo(Survey survey) {
        return commonDao.select("Survey.retrieveQuestionInfo", survey);
    }   
    public Survey retrieveResultInfo(Survey survey) {
        return commonDao.select("Survey.retrieveResultInfo", survey);
    }
    
    public Survey retrieveQuestionDetail(Survey survey) {
    	Survey result = commonDao.select("Survey.retrieveQuestionDetail", survey);
        return result;
    }   
    public Survey retrieveResultDetailInfo(Survey survey) {
    	Survey resultList = commonDao.select("Survey.retrieveResultList", survey);
        return resultList;
    } 
    public List<SurveyForExcel> retrieveResultDetail(Survey survey) {
    	List<SurveyForExcel> resultList = commonDao.selectList("Survey.retrieveResultDetail", survey);
        return resultList;
    }

}
