package teamD.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.MuserDto;


public class MuserDao {
	private static MuserDao dao = new MuserDao();
	private MuserDao() {}
	public static MuserDao getInstance() {
		return dao;
	}
	
	
	
	public List<MuserDto> list()  {
		SqlSession mapper = SqlSessionBean.getSession();
		List<MuserDto> list = mapper.selectList("Muser.list");
		mapper.close();
		return list;
	}
	
	public MuserDto login(Map<String,String> map)  {
		SqlSession mapperSession = SqlSessionBean.getSession();
		MuserDto vo = mapperSession.selectOne("Muser.login",map);
		mapperSession.close();
		return vo;
	}
	
	
	public int insert(MuserDto id){
		SqlSession mapperSession = SqlSessionBean.getSession();
		int rowsAffected = mapperSession.insert("Muser.insert", id);
		mapperSession.commit();
		mapperSession.close();
		return rowsAffected;
	}
	
	
	public int update(MuserDto user) {
	      SqlSession mapper = SqlSessionBean.getSession();
	      int result = mapper.update("Muser.update", user);
	      mapper.commit();
	      mapper.close();
	      return result;
	   }
	
	
	public MuserDto one(String buyid)  {
	      SqlSession mapperSession = SqlSessionBean.getSession();
	      MuserDto vo = mapperSession.selectOne("Muser.one",buyid);
	      mapperSession.close();
	      return vo;
	   }
	
	 public int checkDuplicateId(String id) {
	        SqlSession mapperSession = SqlSessionBean.getSession();
	        int result = 0; // 초기값 0으로 설정 (중복 아이디 없음)
	        try {
	            // MyBatis SQL 쿼리 실행
	            result = mapperSession.selectOne("Muser.checkDuplicateId", id);
	        } finally {
	            mapperSession.close();
	        }
	        return result;
	    }
	
	
	

}
