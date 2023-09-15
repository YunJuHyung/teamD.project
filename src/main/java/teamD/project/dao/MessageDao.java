package teamD.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import teamD.project.dto.MessageDto;


public class MessageDao {
	
	private static MessageDao dao = new MessageDao();
	   private MessageDao() {}
	   public static MessageDao getInstance() {
	      return dao;
	   }


    // 쪽지 보내기
    public int insert(MessageDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int num = mapper.insert("message.sendNote",vo);
		mapper.commit();
		mapper.close();
		return num;
	}
    
    // 특정 수신자의 쪽지 조회
    public List<MessageDto> getMessagesByRecipient(String reciveid){
		SqlSession session = SqlSessionBean.getSession();
		List<MessageDto> list = session.selectList("message.getMessagesByRecipient", reciveid);
		session.close();
		return list;
	}
    public MessageDto getMessageBymidx(long m_idx){
    	SqlSession session = SqlSessionBean.getSession();
    	MessageDto list = session.selectOne("message.getMessageBymidx", m_idx);
    	session.close();
    	return list;
    }
    
    public int statusupdate(long m_idx) {
    	SqlSession mapper = SqlSessionBean.getSession();
		int num = mapper.insert("message.statusupdate",m_idx);
		mapper.commit();
		mapper.close();
		return num;
    }
    
}
