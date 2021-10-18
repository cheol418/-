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
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	String namespace = "admin.model.MemberDao";

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount",map);
		return cnt;
	}

	public List<MemberBean> getMemberList(Paging pageInfo, Map<String, String> map) {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit()); //건너뛸 레코드 갯수,페이지사이즈(한 페이지에 보여줄 레코드 갯수)
		lists = sqlSessionTemplate.selectList(namespace+".getMemberList",map,rowBounds);
		return lists;
	}

	public int deleteMember(int num) {
		return sqlSessionTemplate.delete(namespace+".deleteMember",num);
	}

	public MemberBean getMember(int num) {
		
		return sqlSessionTemplate.selectOne(namespace+".getMember",num);
	}

	public int updateMember(MemberBean bean) {
		return sqlSessionTemplate.update(namespace+".updateMember",bean);
	}

	public int insertMember(MemberBean bean) {
		return sqlSessionTemplate.insert(namespace+".insertMember",bean);
	}
	
	
	
}
