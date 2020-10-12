package devonframe.sample.office.uipattern.employee.service;

import java.util.List;

import devonframe.sample.office.uipattern.common.model.Achievement;


public interface AchievementService {

    public List<Achievement> retrieveAchievementList(Achievement achievement);

    public void insertAchievement(Achievement achievement);

    public void updateAchievement(Achievement achievement);

    public void deleteAchievement(Achievement achievement);

}

