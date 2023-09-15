package teamD.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.McommentDto;

public class McommentDao {
	private static McommentDao dao = new McommentDao();
	private McommentDao() {}
	public static McommentDao getInstance() {
		return dao;
	}
	
	public int insert(McommentDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("Mcomment.insert",vo);
		mapper.commit();
		mapper.close();
		return idx;
	}
	
	public int delete(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("Mcomment.delete",idx);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("Mcommnet.maxOf");
		session.close();
		return result;
	}

	public List<McommentDto> commentsList(long idx){
		SqlSession session = SqlSessionBean.getSession();
		List<McommentDto> list = session.selectList("Mcomment.commentsList",idx);
		session.close();
		return list;
	}
	
	public int setCommentCount(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("setCommentCount", idx);
		session.commit();
		session.close();
		return result;
				
		
	}

}
