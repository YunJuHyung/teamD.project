package teamD.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.McommunityDto;
import teamD.project.dto.MqaDto;
import teamD.project.dto.MserviceDto;

public class MqaDao {
	
	private static MqaDao dao = new MqaDao();
	private MqaDao() {}
	public static MqaDao getInstance() {	
		return dao;
	}
	
	public List<MqaDto> list1() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<MqaDto> list = mapper.selectList("Mqa.list1");
		mapper.close();
		return list;
	}
	
	//메인글 목록 가져오기 - 할일 : 한번에(즉 한페이지에) 글 10개씩 가져오도록 변경  
	public List<MqaDto> pagelist1(Map<String,Integer> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<MqaDto> list = mapper.selectList("Mqa.pagelist1",map);
		mapper.close();
		return list;
	}

	//전체 글 갯수
	public int count1() {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.selectOne("Mqa.qcount");
			mapper.close();
			return result;
	}
		
	public MqaDto qselectByIdx(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		MqaDto vo = mapper.selectOne("Mqa.qselectByIdx",idx);
		mapper.close();
		return vo;
	}
	
	//읽은 메인글 조회수 증가
	public int qsetReadCount(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("Mqa.qsetReadCount", idx);
		session.commit();
		session.close();
		return result;
	}
	
	public int qupdate(MqaDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("Mqa.qupdate",vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public int qdelete(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("Mqa.qdelete",idx);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public long qinsert(MqaDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.insert("Mqa.qinsert",vo);
		mapper.commit();
		mapper.close();
		
		// 매퍼xml에서 selectKey 로 시퀀스 값을 vo객체 idx 프로퍼이테 저장시켰습니다.
		
		return vo.getIdx();
		
	}
	
	public int qsearchCount(String whichSearch, String keyword) {
	    try (SqlSession sqlSession = SqlSessionBean.getSession()) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("whichSearch", whichSearch);
	        map.put("keyword", keyword);
	        return sqlSession.selectOne("Mqa.qsearchCount", map);
	    }
	}

	// 검색된 게시글 목록 조회
	public List<MqaDto> qsearchPagelist(String whichSearch, String keyword, int start, int end) {
	    try (SqlSession sqlSession = SqlSessionBean.getSession()) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("whichSearch", whichSearch);
	        map.put("keyword", keyword);
	        map.put("start", start);
	        map.put("end", end);
	        return sqlSession.selectList("Mqa.qsearchPagelist", map);
	    }
	}
	
}
