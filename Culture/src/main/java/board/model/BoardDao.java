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
	
	public int getTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getTotalCount",map);
	}

	
	public int getNoticeTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getNoticeTotalCount",map);
		
	}
	
	public int getQnaTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getQnaTotalCount",map);
	}

	public int getFreeTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getFreeTotalCount",map);
	}

	
	
	
	public List<BoardBean> getNoticeBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getNoticeBoardList",map,rowbounds);
	}
	
	public List<BoardBean> getQnaBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getQnaBoardList",map,rowbounds);
	}
	

	public List<BoardBean> getFreeBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getFreeBoardList",map,rowbounds);
	}	

	public List<BoardBean> getTotalBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getTotalBoardList",map,rowbounds);
	}

	public void updateReadCount(int num) {
		sqlSessionTemplate.update(namespace+".updateReadCount",num);
		
	}

	public BoardBean getBoardData(int num) {
		return sqlSessionTemplate.selectOne(namespace+".getBoardData",num);
	}

	public int insertData(BoardBean bean) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertData", bean);
		return cnt;
	}
	
	public int updateBoard(BoardBean bean) {
		return sqlSessionTemplate.update(namespace+".updateBoard",bean);
	}

	public void insertReplyBoard(BoardBean bean) {
		// TODO Auto-generated method stub
		
	}


	public void deleteBoardData(int num) {
		sqlSessionTemplate.delete(namespace+".deleteBoardData",num);	
		
	}


	public int insertClubData(BoardBean bean) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertClubData", bean);
		return cnt;
	}


	
	
}





