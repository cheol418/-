package board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("brDao")
public class BoardReplyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	String namespace="board.model.BoardReplyBean";
	
	public List<BoardReplyBean> getTotalBoardReplyList(int num) {
		System.out.println("hohohohoo: " + num);
		return sqlSessionTemplate.selectList(namespace+".readReply",num);
	}

	public int writeReply(BoardReplyBean replybean) {
		return sqlSessionTemplate.insert(namespace+".writeReply",replybean);
		// TODO Auto-generated method stub
		
	}

	public void deleteBoardReplyData(int num) {
		sqlSessionTemplate.delete(namespace+".deleteBoardReplyData",num);
		
	}
	
	
}
