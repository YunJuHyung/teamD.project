package teamD.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.MproductDto;


public class MproductDao {
   private static MproductDao dao = new MproductDao();
   private MproductDao() {}
   public static MproductDao getInstance() {
      return dao;
   }
   
   public MproductDto detail(int pcode) {
	   SqlSession mapper = SqlSessionBean.getSession();
	   MproductDto vo = mapper.selectOne("Mproduct.detail",pcode);
	   mapper.close();
	   return vo;
   }
   
   

   public List<MproductDto> list() {
      SqlSession mapper = SqlSessionBean.getSession();
      List<MproductDto> list = mapper.selectList("Mproduct.list");
      mapper.close();
      return list;
   }
   
   public List<MproductDto> recentlist() {
	      SqlSession mapper = SqlSessionBean.getSession();
	     List<MproductDto> list = mapper.selectList("Mproduct.recentlist");
	      mapper.close();
	      return list;
	   }
   
   
   public List<MproductDto> mostlist() {
      SqlSession mapper = SqlSessionBean.getSession();
      List<MproductDto> list = mapper.selectList("Mproduct.mostlist");
      mapper.close();
      return list;
      
   }
   
   public List<MproductDto> pnamelist(String pname) {
	      SqlSession mapper = SqlSessionBean.getSession();
	      List<MproductDto> list = mapper.selectList("Mproduct.list",pname);
	      mapper.close();
	      return list;
	   }
   
   
   public int readCount(int pcode) {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.update("Mproduct.readCount", pcode);
      mapper.commit();
      mapper.close();
      return result;
   }
   
   
      public int insert(MproductDto dto) {
   		SqlSession mapper = SqlSessionBean.getSession();
   		int result = mapper.insert("Mproduct.insert",dto);
   		mapper.commit();		
   		mapper.close();
   		return result;
   	}
      
      public List<MproductDto> pagelist(Map<String,Object> map) {
  		SqlSession mapper = SqlSessionBean.getSession();
  		List<MproductDto> list = mapper.selectList("Mproduct.pagelist",map);
  		mapper.close();
  		return list;
  	} 
      
      
      public int count() {
          SqlSession mapper = SqlSessionBean.getSession();
          int result = mapper.selectOne("Mproduct.count");
          mapper.close();
          return result;
       }
      
  	public int searchCount(String keyword) {
	    try (SqlSession sqlSession = SqlSessionBean.getSession()) {
	    	
	        return sqlSession.selectOne("Mproduct.searchCount", keyword);
	    }
	}
  	
  	public int categoryCount(String category) {
  		try (SqlSession sqlSession = SqlSessionBean.getSession()) {
  			return sqlSession.selectOne("Mproduct.categoryCount", category);
  		}
  	}
      
  	
  	// 검색된 게시글 목록 조회
   	public List<MproductDto> searchlist(Map<String,Object> map) {
   		try (SqlSession sqlSession = SqlSessionBean.getSession()) {
   			return sqlSession.selectList("Mproduct.searchlist", map);
   		}
   	}  

   	public List<MproductDto> categorylist(Map<String,Object> map) {
   		try (SqlSession sqlSession = SqlSessionBean.getSession()) {
   			return sqlSession.selectList("Mproduct.categorylist", map);
   		}
   	}
  	
  	
      
      public List<MproductDto> buylist(Map<String, Object> map) {
          SqlSession mapper = SqlSessionBean.getSession();
          List<MproductDto> list = mapper.selectList("Mproduct.mybuylist",map);
          mapper.close();
          return list;
       } 
      
      public List<MproductDto> selllist(Map<String, Object> map) {
          SqlSession mapper = SqlSessionBean.getSession();
          List<MproductDto> list = mapper.selectList("Mproduct.myselllist",map);
          mapper.close();
          return list;
       } 
      
      public int buycount(String id) {
          SqlSession mapper = SqlSessionBean.getSession();
          int result = mapper.selectOne("Mproduct.buycount",id);
          mapper.close();
          return result;
       }
       
       public int sellcount(String id) {
          SqlSession mapper = SqlSessionBean.getSession();
          int result = mapper.selectOne("Mproduct.sellcount",id);
          mapper.close();
          return result;
       }
       
       public MproductDto oneBypcode(int pcode) {
           SqlSession mapper = SqlSessionBean.getSession();
           MproductDto dto = mapper.selectOne("Mproduct.oneBypcode",pcode);
           mapper.close();
           return dto;
        }
       
       public int update(Map<String, Object> map) {
    	      SqlSession mapper = SqlSessionBean.getSession();
    	      int result = mapper.update("Mproduct.update",map);
    	      mapper.commit();
    	      mapper.close();
    	      return result;
    	   }
   

   
   
}