package devonframe.gyva.front.contents.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.gyva.front.common.fileupload.service.FileUploadService;
import devonframe.gyva.front.contents.model.Contents;
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

    public Contents retrieveContents(Contents contents) {
        return commonDao.select("Contents.retrieveContents", contents);
    }    
    
    @Override
    public List<Contents> retrieveContentsList(Contents contents) {
        List<Contents> resultList = commonDao.selectList("Contents.retrieveContentsList", contents);
        return resultList;
    }   
    
    @Override
    public List<Contents> retrieveLikeContentsList(Contents contents) {
        List<Contents> resultList = commonDao.selectList("Contents.retrieveLikeContentsList", contents);
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
    public void insertLikeDislike(Contents contents) {
    	commonDao.insert("Contents.insertLikeDislike", contents);
    }
    
    @Override
    public void updateLikeDislike(Contents contents) {
    	commonDao.update("Contents.updateLikeDislike", contents);
    }
    
    @Override
    public String retrieveNextContentsId(Contents contents) {
    	return commonDao.select("Contents.retrieveNextContentsId", contents);
    }
    
    @Override
    public String retrieveBiggestContentsId(Contents contents) {
    	return commonDao.select("Contents.retrieveBiggestContentsId", contents);
    }
    
    @Override
    public String retrieveSmallestContentsId(Contents contents) {
    	return commonDao.select("Contents.retrieveSmallestContentsId", contents);
    }
    
    @Override
    public String retrieveFunNextContentsId(String contentsName) {
    	return commonDao.select("Contents.retrieveFunNextContentsId", contentsName);
    }

}
