package dao;

import org.mybatis.spring.SqlSessionTemplate;

import vo.AdminVO;

public class AdminDAOImpl implements AdminDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;

	
	public AdminDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public AdminVO selectAdminById(String adminId) {
		return sqlSessionTemplate.selectOne("adminDAO.selectAdminById", adminId);
	}

}
