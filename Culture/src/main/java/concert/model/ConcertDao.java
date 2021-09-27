package concert.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("cDao")
public class ConcertDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	String namespace="concert.model.";

}
