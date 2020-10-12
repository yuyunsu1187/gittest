package devonframe.gyva.front.contents.notice.service;

import java.util.List;
import java.util.Map;

import devonframe.gyva.front.contents.model.Contents;
import devonframe.paging.model.PagingEntity;


public interface NoticeContentsService {

    public Contents retrieveFrontMenuId(Map<String, Object> contents);
    public Contents retrieveContents(Contents contents);
    public List<Map<String, Object>> retrieveContentsList(Map<String, Object> contents);
    public List<Map<String, Object>> retrieveContentsPagedList(PagingEntity contents);
    
}
