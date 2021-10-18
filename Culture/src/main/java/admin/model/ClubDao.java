package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class ClubDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	String namespace = "admin.model.ClubDao";

	public int getTotalClubCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalClubCount",map);
		return cnt;
	}

	public List<ClubBean> getClubList(Paging pageInfo, Map<String, String> map) {
		List<ClubBean> lists = new ArrayList<ClubBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getClubList",map,rowBounds);
		return lists;
	}

	public int deleteClub(int num) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteClub",num);
		return cnt;
	}

	public ClubBean getClub(int num) {
		return sqlSessionTemplate.selectOne(namespace+".getClub",num);
	}

	public int updateClub(ClubBean bean) {
		return sqlSessionTemplate.update(namespace+".updateClub",bean);
	}

	public int insertClub(ClubBean bean) {
	
		return sqlSessionTemplate.insert(namespace+".insertClub",bean);
	}

		
	
}
