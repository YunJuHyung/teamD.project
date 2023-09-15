package teamD;

import java.util.List;

import teamD.project.dao.MproductDao;
import teamD.project.dto.MproductDto;

public class Test {
	
	
	public static void main(String[] args) {
		MproductDao dao = MproductDao.getInstance();
		List<MproductDto> list = dao.recentlist();
		
		System.out.println(list);
	}
	
	
	
	
}
