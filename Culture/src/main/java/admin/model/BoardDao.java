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
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	String namespace="admin.model.BoardDao";
	
	public int getTotalBoardCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalBoardCount",map);
		return cnt;
	}

	public List<BoardBean> getBoardList(Paging pageInfo, Map<String, String> map) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists =  sqlSessionTemplate.selectList(namespace+".getBoardList",map,rowbounds);
		return lists;
		
	}

	public int write(BoardBean bean) {
		return sqlSessionTemplate.insert(namespace+".write",bean);
	}

	public BoardBean getBoard(int num) {
		
		return sqlSessionTemplate.selectOne(namespace+".getBoard",num);
	}

	public int deleteBoard(int num) {
		return sqlSessionTemplate.delete(namespace+".deleteBoard",num);
	}

	public void updateReadCount(int num) {
		sqlSessionTemplate.update(namespace+".updateReadCount",num);
	
	}

	public int updateBoard(BoardBean bean) {
		return sqlSessionTemplate.update(namespace+".updateBoard",bean);
	}

	public void writeReplyBoard(BoardBean bean) {
		sqlSessionTemplate.update(namespace+".updateReplyBoard",bean);
		sqlSessionTemplate.insert(namespace+".writeReplyBoard",bean);
	}
	
}