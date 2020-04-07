package service;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import dao.OrderDAO;
import vo.BankVO;
import vo.GuestVO;
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
	public PayBankVO selectVirtualAccountByPayNum(int payNum) {
		return orderDAO.selectByVirtualAccount(payNum);
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
	public void updatePaydateByPaybank(String vaNum) {
		orderDAO.updatePaydateByPaybank(vaNum);
		
	}

	@Override //주문상태 변경
	public void updateStateByOrder(int payNum) {
		orderDAO.updateStateByOrder(payNum);
		
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
	public OrderVO selectTonameOrderNum(String toName) {
		return orderDAO.selectTonameOrderNum(toName);
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
	
	@Override
	public OrderListVO selectOrderListByOlNum(int olNum) {
		return orderDAO.selectOrderListByOlNum(olNum);
	}
	
	@Override
	public int updateOrderByOrderNum(int orderNum) {
		return orderDAO.updateOrderByOrderNum(orderNum);
	}
	
	@Override
	public List<OrderVO> selectOrderSearch(OrderVO orderVO) {
		return orderDAO.selectOrderSearch(orderVO);
	}
	
	@Override
	public List<OrderVO> selectOrderSort(OrderVO orderVO) {
		return orderDAO.selectOrderSort(orderVO);
	}
	
	@Override
	public int selectPayNumConut(int payNum) {
		return orderDAO.selectPayNumConut(payNum);
	}
	
	@Override
	public List<OrderVO> selectOrderDate(OrderVO orderVO) {
		return orderDAO.selectOrderDate(orderVO);
	}

	@Override
	public int updatePayPriceVirtualAccount(VirtualAccountVO virtualAccountVO) {
		return orderDAO.updatePayPriceVirtualAccount(virtualAccountVO);
	}
	
	@Override
	public List<OrderVO> selectOrderByPayNum(int payNum) {
		return orderDAO.selectOrderByPayNum(payNum);
	}
	public void insertGuest(GuestVO guestVO) {
				orderDAO.insertGuest(guestVO);
		
	}

	@Override
	public  List<GuestVO> selectOrderByGuest(GuestVO guestVO) {
		return orderDAO.selectOrderByGuest(guestVO);
	}

	@Override
	public List<OrderListVO> selectOrderListByorderNum(int[] orderNum) {
		return orderDAO.selectOrderListByorderNum(orderNum);
	}

	@Override
	public List<VirtualAccountVO> selectVirtualAccountVO(int[] orderNum) {
		return orderDAO.selectVirtualAccountVO(orderNum);
	}

	@Override
	public List<OrderVO> selectOrderByorderNums(int[] orderNum) {
		return orderDAO.selectOrderByorderNums(orderNum);
	}

	@Override
	public List<Integer> selectPayBankByPayNum(int[] payNums) {
		return orderDAO.selectPayBankByPayNum(payNums);
	}

	@Override
	public List<Integer> selectPayCardByPayNum(int[] payNums) {
		return orderDAO.selectPayCardByPayNum(payNums);
	}

	@Override
	public List<BankVO> selectBankCodeList() {
		return orderDAO.selectBankCodeList();
	}

	@Override
	public BankVO selectBankName(int bankCode) {
		return orderDAO.selectBankName(bankCode);
	}

	@Override
	public int deleteVirtualAccount(String vaNum) {
		return orderDAO.deleteVirtualAccount(vaNum);
	}

	@Override
	public int updateOrderState(OrderVO orderVO) {
		return orderDAO.updateOrderState(orderVO);
	}
	
	@Override
	public List<OrderListVO> selectBuyCount(int[] optionNums) {
		return orderDAO.selectBuyCount(optionNums);
	}
	
	@Override
	public List<OrderVO> selectOrderAll() {
		return orderDAO.selectOrderAll();
	}

	@Override
	public List<VirtualAccountVO> selectAllVirtualAccountVO(int paynum) {
		return orderDAO.selectAllVirtualAccountVO(paynum);
	}

	@Override
	public List<OrderVO> selectOrderAllState(String state) {
		return orderDAO.selectOrderAllState(state);
	}
	
	@Scheduled(fixedDelay=1000)
	public void deliveryCheck(HttpServletResponse resp) {
		
		List<OrderVO> list = orderDAO.selectOrderAllState("배송 중");
		for(int i = 0 ; i < list.size() ; i++) {
			String trackingNum = list.get(i).getTrackingNum();
			String trackingCode = list.get(i).getTrackingCode();
			int orderNum = list.get(i).getOrderNum();
			try {
				resp.sendRedirect("deliveryCheck?trackingNum=" + trackingNum + "&trackingCode=" + trackingCode + "&orderNum=" + orderNum);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	
	


}
