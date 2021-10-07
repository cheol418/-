package user.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("uDao")
public class UserDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	String namespace="user.model.User.";
	public UserVo getUserData(Map<String,String> map) {
		return sqlSessionTemplate.selectOne(namespace+"getUserData",map);
	}
}
