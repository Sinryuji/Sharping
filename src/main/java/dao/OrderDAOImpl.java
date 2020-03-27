package dao;

import org.mybatis.spring.SqlSessionTemplate;

import vo.OrderVO;

public class OrderDAOImpl implements OrderDAO{

	private SqlSessionTemplate sqlSessionTemplate;

	public OrderDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int insertOrder(OrderVO orderVO) {
		return sqlSessionTemplate.insert("orderDAO.insertOrder", orderVO);
	}
}
