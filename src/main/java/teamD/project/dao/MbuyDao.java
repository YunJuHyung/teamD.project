package teamD.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.MbuyDto;

public class MbuyDao {
	private static MbuyDao dao = new MbuyDao();
	private MbuyDao() {}
	public static MbuyDao getInstance() {
		return dao;
	}
	
	public List<MbuyDto> requestlist(String id) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<MbuyDto> list = mapper.selectList("Mbuy.requestlist",id);
		mapper.close();
		return list;
	}
	
	public int buyinsert(MbuyDto dto) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("Mbuy.buyinsert",dto);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	   public MbuyDto onembuy(Map<String,Object> map) {
		   SqlSession mapper = SqlSessionBean.getSession();
		   MbuyDto dto = mapper.selectOne("Mbuy.onembuy",map);
		   mapper.close();
		   return dto;
	   } 
	   
	   
	   public int pcodecount(int pcode) {
		   SqlSession mapper = SqlSessionBean.getSession();
		   int result = mapper.selectOne("Mbuy.pcodecount",pcode);
		   mapper.close();
		   return result;
	   }
	   
	   
	   public List<MbuyDto> pcodelist(Map<String,Integer> map) {
	    	  SqlSession mapper = SqlSessionBean.getSession();
	    	  List<MbuyDto> list = mapper.selectList("Mbuy.pcodelist",map);
	    	  mapper.close();
	    	  return list;
	      } 
	   
	   public int delete(int pcode) {
		   SqlSession mapper = SqlSessionBean.getSession();
		   int result = mapper.delete("Mbuy.delete",pcode);
		   mapper.commit();
		   mapper.close();
		   return result;
		   
	   }
	   
	   public int paylist(Map<String, Object> map) {
			SqlSession mapper = SqlSessionBean.getSession();
			int list = mapper.selectOne("Mbuy.paylist",map);
			mapper.close();
			return list;
		   
	   }
	   
	    public int update(Map<String, Integer> map) {
  	      SqlSession mapper = SqlSessionBean.getSession();
  	      int result = mapper.update("Mbuy.priceupdate",map);
  	      mapper.commit();
  	      mapper.close();
  	      return result;
  	   }
	   
	   public int requestcount(String id) {
		   SqlSession mapper = SqlSessionBean.getSession();
		   int result = mapper.selectOne("Mbuy.requestcount",id);
		   mapper.close();
		   return result;
		   
		   
	   }
	    
	   
	   
	
}
 