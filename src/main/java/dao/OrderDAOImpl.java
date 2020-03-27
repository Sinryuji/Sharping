package dao;

import org.mybatis.spring.SqlSessionTemplate;

import vo.OrderListVO;
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
	
	@Override
	public int insertPayCard(OrderVO orderVO) {
		return sqlSessionTemplate.insert("orderDAO.insertPayCard", orderVO);
	}
	
	@Override
	public OrderVO selectLatelyOrderNum(String id) {
		return sqlSessionTemplate.selectOne("orderDAO.selectLatelyOrderNum", id);
	}
	
	@Override
	public int insertOrderList(OrderListVO orderListVO) {
		return sqlSessionTemplate.insert("orderDAO.insertOrderList", orderListVO);
	}
	
	@Override
	public int decrementStockProduct(OrderListVO orderListVO) {
		return sqlSessionTemplate.update("orderDAO.decrementStockProduct", orderListVO);
	}
	
	@Override
	public int decrementStockOption(OrderListVO orderListVO) {
		return sqlSessionTemplate.update("orderDAO.decrementStockOption", orderListVO);
	}
	
	@Override
	public int selectProductNumByOptionNum(int optionNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectProductNumByOptionNum", optionNum);
	}
}
