package teamD.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.McommunityDto;
import teamD.project.dto.MserviceDto;

public class MserviceDao {
	
	private static MserviceDao dao = new MserviceDao();
	private MserviceDao() {}
	public static MserviceDao getInstance() {	
		return dao;
	}
	
	public List<MserviceDto> list() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<MserviceDto> list = mapper.selectList("mservice.list");
		mapper.close();
		return list;
	}
	
	//메인글 목록 가져오기 - 할일 : 한번에(즉 한페이지에) 글 10개씩 가져오도록 변경  
	public List<MserviceDto> pagelist(Map<String,Integer> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<MserviceDto> list = mapper.selectList("mservice.pagelist",map);
		mapper.close();
		return list;
	}

	//전체 글 갯수
	public int count() {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.selectOne("mservice.count");
			mapper.close();
			return result;
	}
		
	public MserviceDto selectByIdx(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		MserviceDto vo = mapper.selectOne("mservice.selectByIdx",idx);
		mapper.close();
		return vo;
	}
	
	//읽은 메인글 조회수 증가
	public int setReadCount(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("mservice.setReadCount", idx);
		session.commit();
		session.close();
		return result;
	}
	
	public int update(MserviceDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("mservice.update",vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public int delete(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("mservice.delete",idx);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public long insert(MserviceDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.insert("mservice.insert",vo);
		mapper.commit();
		mapper.close();
		
		// 매퍼xml에서 selectKey 로 시퀀스 값을 vo객체 idx 프로퍼이테 저장시켰습니다.
		
		return vo.getIdx();
		
	}
	
	public int searchCount(String whichSearch, String keyword) {
	    try (SqlSession sqlSession = SqlSessionBean.getSession()) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("whichSearch", whichSearch);
	        map.put("keyword", keyword);
	        return sqlSession.selectOne("mservice.searchCount", map);
	    }
	}

	// 검색된 게시글 목록 조회
	public List<MserviceDto> searchPagelist(String whichSearch, String keyword, int start, int end) {
	    try (SqlSession sqlSession = SqlSessionBean.getSession()) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("whichSearch", whichSearch);
	        map.put("keyword", keyword);
	        map.put("start", start);
	        map.put("end", end);
	        return sqlSession.selectList("mservice.searchPagelist", map);
	    }
	}
	
}
