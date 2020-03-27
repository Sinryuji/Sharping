package service;


import org.springframework.stereotype.Service;

import dao.OrderDAO;
import vo.OrderListVO;
import vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService{

	private OrderDAO orderDAO;

	public OrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}
	
	@Override
	public int insertOrder(OrderVO orderVO) {
		return orderDAO.insertOrder(orderVO);
	}
	
	@Override
	public int insertPayCard(OrderVO orderVO) {
		return orderDAO.insertPayCard(orderVO);
	}
	
	@Override
	public OrderVO selectLatelyOrderNum(String id) {
		return orderDAO.selectLatelyOrderNum(id);
	}
	
	@Override
	public int insertOrderList(OrderListVO orderListVO) {
		return orderDAO.insertOrderList(orderListVO);
	}
	
	@Override
	public int decrementStockProduct(OrderListVO orderListVO) {
		return orderDAO.decrementStockProduct(orderListVO);
	}
	
	@Override
	public int decrementStockOption(OrderListVO orderListVO) {
		return orderDAO.decrementStockOption(orderListVO);
	}
	
	@Override
	public int selectProductNumByOptionNum(int optionNum) {
		return orderDAO.selectProductNumByOptionNum(optionNum);
	}
}
