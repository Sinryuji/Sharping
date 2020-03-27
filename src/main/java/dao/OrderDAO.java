package dao;

import vo.OrderListVO;
import vo.OrderVO;

public interface OrderDAO {

	public abstract int insertOrder(OrderVO orderVO);
	
	public abstract int insertPayCard(OrderVO orderVO);
	
	public abstract OrderVO selectLatelyOrderNum(String id);
	
	public abstract int insertOrderList(OrderListVO orderListVO);
	
	public abstract int decrementStockProduct(OrderListVO orderListVO);
	
	public abstract int decrementStockOption(OrderListVO orderListVO);
	
	public abstract int selectProductNumByOptionNum(int optionNum);

}

