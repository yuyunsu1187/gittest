package devonframe.gyva.contents.service;

import java.util.List;

import devonframe.gyva.contents.model.Contents;
import devonframe.paging.model.PagingEntity;


public interface ContentsService {

    public Contents retrieveFrontMenuId(Contents contents);
    public Contents retrieveAdminMenuId(Contents contents);
    
    public Contents retrieveContents(Contents contents);

    // Contents List 조회
	public void insertContents(Contents contents);
	public void updateContents(Contents contents);
	public void updateDeleteYnContents(Contents contents);
	
    public List<Contents> retrieveContentsList(Contents contents);
    public List<Contents> retrieveBookmarkContentsList(Contents contents);
    public List<Contents> retrieveActivityContentsList(Contents contents);
    
    public String retrieveSearchResultCnt(Contents contents);
    public List<Contents> retrieveSearchResultList(Contents contents);
    
    public List<Contents> retrieveContentsPagedList(PagingEntity contents);
        
    public int updateBookmark(Contents contents);
    public String retrieveFunNextContentsId(String contentsName);    
    
    public List<Contents> resultRegistrtionList(String menuId);
    public List<Contents> resultAcademyList(String menuId);
    
}
