package devonframe.gyva.admin.contents.survey.service;

import java.util.List;

import devonframe.gyva.admin.contents.survey.model.Survey;
import devonframe.gyva.admin.contents.survey.model.SurveyForExcel;
import devonframe.paging.model.PagingEntity;

public interface SurveyService {

    public List<Survey> retrieveQuestionPagedList(PagingEntity survey);
    public List<Survey> retrieveResultPagedList(PagingEntity survey);

    public String retrieveSurveyId(String name);
    
	public void insertQuestionInfo(Survey survey);
	public void updateQuestionInfo(Survey survey);
	
	public void insertSurveyResult(Survey survey);
	public void updateSurveyResult(Survey survey);
	
    public Survey retrieveQuestionInfo(Survey survey);
    public Survey retrieveResultInfo(Survey survey);
	
    public Survey retrieveQuestionDetail(Survey survey);
    public Survey retrieveResultDetailInfo(Survey survey);
    public List<SurveyForExcel> retrieveResultDetail(Survey survey);
	
}
