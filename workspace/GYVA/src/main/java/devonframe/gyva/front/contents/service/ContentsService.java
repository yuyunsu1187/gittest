package devonframe.gyva.front.contents.service;

import java.util.List;

import devonframe.gyva.front.contents.model.Contents;


public interface ContentsService {

    public Contents retrieveFrontMenuId(Contents contents);
    
    public Contents retrieveContents(Contents contents);

    // Contents List 조회
	public void insertContents(Contents contents);
	public void updateContents(Contents contents);
	public void updateDeleteYnContents(Contents contents);
	
    public List<Contents> retrieveContentsList(Contents contents);
    public List<Contents> retrieveLikeContentsList(Contents contents);
    
    public void insertLikeDislike(Contents contents);    
    public void updateLikeDislike(Contents contents);
    public String retrieveNextContentsId(Contents contents);
    public String retrieveBiggestContentsId(Contents contents);
    public String retrieveSmallestContentsId(Contents contents);
    public String retrieveFunNextContentsId(String contentsName);
}
