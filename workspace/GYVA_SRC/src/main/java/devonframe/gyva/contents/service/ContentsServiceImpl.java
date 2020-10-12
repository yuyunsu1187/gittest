package devonframe.gyva.contents.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.common.fileupload.service.FileUploadService;
import devonframe.gyva.contents.model.Contents;
import devonframe.paging.model.PagingEntity;

@Service("contentsService")
public class ContentsServiceImpl implements ContentsService{

    @Resource(name = "commonDao")
    private CommonDao commonDao;
    
    @Resource(name = "fileUploadService")
    private FileUploadService fileUploadService;


    @Override
    public Contents retrieveFrontMenuId(Contents contents) {
        return commonDao.select("Contents.retrieveFrontMenuId", contents);
    }
    
    @Override
    public Contents retrieveAdminMenuId(Contents contents) {
        return commonDao.select("Contents.retrieveAdminMenuId", contents);
    }

    public Contents retrieveContents(Contents contents) {
        return commonDao.select("Contents.retrieveContents", contents);
    }    
    
    @Override
    public List<Contents> retrieveContentsList(Contents contents) {
        List<Contents> resultList = commonDao.selectList("Contents.retrieveContentsList", contents);
        return resultList;
    }   
    
    @Override
    public List<Contents> retrieveBookmarkContentsList(Contents contents) {
        List<Contents> resultList = commonDao.selectList("Contents.retrieveBookmarkContentsList", contents);
        return resultList;
    } 

    public List<Contents> retrieveActivityContentsList(Contents contents) {
        List<Contents> resultList = commonDao.selectList("Contents.retrieveActivityContentsList", contents);
        return resultList;
    } 

    public String retrieveSearchResultCnt(Contents contents) {
        return commonDao.select("Contents.retrieveSearchResultCnt", contents);
    } 

    public List<Contents> retrieveSearchResultList(Contents contents) {
        List<Contents> resultList = commonDao.selectList("Contents.retrieveSearchResultList", contents);
        return resultList;
    } 

    public List<Contents> retrieveContentsPagedList(PagingEntity contents) {
        List<Contents> resultList = commonDao.selectPagedList("Contents.retrieveContentsList", contents);
        return resultList;
    }
    
    // Contents 저장
 	@Override
 	public void insertContents(Contents contents) {
 		commonDao.insert("Contents.insertContents", contents);
 	}
    
 	// Contents 수정
  	@Override
 	public void updateContents(Contents contents) {
  		commonDao.update("Contents.updateContents", contents);
 	}
 	
  	// Contents 삭제
   	@Override
  	public void updateDeleteYnContents(Contents contents) {
   		commonDao.update("Contents.updateDeleteYnContents", contents);
   	}
    
    @Override
    public int updateBookmark(Contents contents) {
    	int result = commonDao.update("Contents.updateBookmark", contents);
    	return result;
    }
    
    @Override
    public String retrieveFunNextContentsId(String contentsName) {
    	return commonDao.select("Contents.retrieveFunNextContentsId", contentsName);
    }

    public List<Contents> resultRegistrtionList(String menuId) {
        List<Contents> resultList = commonDao.selectList("Contents.resultMainRegistrtionList", menuId);
        return resultList;
    }

    public List<Contents> resultAcademyList(String menuId) {
        List<Contents> resultList = commonDao.selectList("Contents.retrieveMainAcademyList", menuId);
        return resultList;
    }

}
