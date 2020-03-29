package service;


import org.springframework.stereotype.Service;

import dao.OrderDAO;

import java.util.List;

import vo.BankVO;

import vo.OrderListVO;
import vo.OrderVO;
import vo.PayBankVO;
import vo.PayMoneyVO;
import vo.VirtualAccountVO;

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

	@Override //가상계좌 인설트 
	public int insertByvirtualAccount(VirtualAccountVO virtualAccountVO) {
		return orderDAO.insertByvirtualAccount(virtualAccountVO);
	}

	@Override //주문번호 셀렉트 
	public OrderVO selectOrderByorderNum(int  orderNum) {
		return orderDAO.selectOrderByorderNum(orderNum);
	}

	@Override //은행코드 셀렉트
	public int selectBankCode(int bankCode) {
		return orderDAO.selectBankCode(bankCode);
	}

	@Override //가상계좌 셀렉트
	public PayBankVO selectVirtualAccountByorderNum(int orderNum) {
		return orderDAO.selectByVirtualAccount(orderNum);
	}

	@Override //무통장 입금테이블 인설트
	public int insertPayBank(PayBankVO payBankVO) {
		return orderDAO.insertByPayBank(payBankVO);
	}

	@Override //무통장입금 테이블 셀렉트
	public PayBankVO selectPayBank(int orderNum) {
		return orderDAO.selectPayBank(orderNum);
	}

	@Override //가상계좌 resp코드 업데이트
	public int updateRespCode(PayMoneyVO payMoney) {
		return orderDAO.updateRespCode(payMoney);
	}

	@Override //무통장입금 결제완료일 업데이트
	public void updatePaydateByPaybank(int result) {
		orderDAO.updatePaydateByPaybank(result);
		
	}

	@Override //주문상태 변경
	public void updateStateByOrder(int success) {
		orderDAO.updateStateByOrder(success);
		
	}

	@Override
	public List<BankVO> selectBankCodeList() {
		return orderDAO.selectBankCodeList();
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
	
	@Override
	public List<OrderVO> selectOrderById(String id) {
		return orderDAO.selectOrderById(id);
	}
	
	@Override
	public List<OrderListVO> selectOrderListByOrderNum(int orderNum) {
		return orderDAO.selectOrderListByOrderNum(orderNum);
	}

}
