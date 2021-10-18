package concert.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;

@Component("cDao")
public class ConcertDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	String namespace="concert.model.Concert.";
	public List<BoardBean> getBoardNotice() {
		return sqlSessionTemplate.selectList(namespace+"getBoardNotice");
	}
	public List<BoardBean> getBoard() {
		return sqlSessionTemplate.selectList(namespace+"getBoard");
	}

}
