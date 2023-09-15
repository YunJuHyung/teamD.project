package teamD.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.MqcommentDto;

public class MqcommentDao {
	private static MqcommentDao dao = new MqcommentDao();
	private MqcommentDao() {}
	public static MqcommentDao getInstance() {
		return dao;
	}
	
	public int insert(MqcommentDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("Mqcomments.insert",vo);
		mapper.commit();
		mapper.close();
		return idx;
	}
	
	public int delete(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("Mqcomments.delete",idx);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("Mqcomments.maxOf");
		session.close();
		return result;
	}
	
	public List<MqcommentDto> commentsList(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		List<MqcommentDto> list = session.selectList("Mqcomments.commentsList",idx);
		session.close();
		return list;
	}
	
	//메인글의 댓글 갯수 업데이트	
	public int setqCommentCount(long idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("setqCommentCount", idx);
		session.commit();
		session.close();
		return result;
	}

}
