package service;

import dao.OrderDAO;
import vo.OrderVO;

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
}
