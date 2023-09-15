package teamD;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;

import mybatis.SqlSessionBean;
import teamD.project.dao.MproductDao;
import teamD.project.dao.MuserDao;
import teamD.project.dto.MproductDto;
import teamD.project.dto.MuserDto;

class Test11 {

	
	
	 @Test void write() { 
		 
	 MuserDao dao = MuserDao.getInstance();
	 List<MuserDto> list = dao.list();
	 
	 System.out.println(list); 
	 assertNotNull(list);
	 
	 }
	 
		/*
		 * @Test void all() { MproductDao dao = MproductDao.getInstance();
		 * List<MproductDto> list = dao.list(); System.out.println(list);
		 * assertNotNull(list);
		 * 
		 * 
		 * }
		 */
	 

	/*
	 * @Test void write() { SqlSession mapper = SqlSessionBean.getSession(); }
	 */

}
