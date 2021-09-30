package board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("bDao")
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	String namespace="board.model.Board";
	
	public int getNoticeTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getNoticeTotalCount",map);
		
	}

	public List<BoardBean> getNoticeBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getNoticeBoardList",map,rowbounds);
	}

	public List<BoardBean> getTotalBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getTotalBoardList",map,rowbounds);
	}
	

}
