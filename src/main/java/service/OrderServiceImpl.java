package service;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import dao.OrderDAO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

//	@Override
//	public List<VirtualAccountVO> selectAllVirtualAccountVO(int paynum) {
//		return orderDAO.selectAllVirtualAccountVO(paynum);
//	}

//	@Override
//	public List<OrderVO> selectOrderAllState(String state) {
//		return orderDAO.selectOrderAllState(state);
//	}
	
	@Scheduled(cron = "* * */24 * * * ")
	public void stateChange() {
		List<VirtualAccountVO> virList = null;
		String stateName = "입금 대기";
		String stateCancle = "주문 취소";
		//"입금 대기" 오더리스트 뽑아오기
		List<OrderVO> state = orderDAO.selectOrderAllState(stateName); 
		//날자 변환 포맷
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		// 현재 시간 포맷
		String time1 = format1.format(time);
		System.out.println("현재시간:" + time1);
		for(int i = 0 ; i < state.size() ; i++) {
			//오더리스트의 결제번호로 가상계좌 셀렉트
			virList = orderDAO.selectAllVirtualAccountVO(state.get(i).getPayNum());
			System.out.println(virList.toString());
			//가상계좌의 입금마감일 뽑아오기
			String depositDate = format1.format(virList.get(0).getDepositDate());
			System.out.println(virList.get(0).getDepositDate());
			
			System.out.println("depositDate:" + depositDate);
			//현재 시간이랑 가상계좌의 입금마감일 비교
			int compare = depositDate.compareTo(time1);
			System.out.println("compare :" + compare);
			if(compare > 0) { // 입금마감일이 현재시간보다 크면 
				
			}else if(compare < 0){ // 입금마감일이 현재시간보다 작으면 
				//주문취소 들어가
				orderDAO.updateOrderByOrderNum(state.get(i).getOrderNum());
				
			}else { // 입금마감일이 현재시간과 같으면 
				//이것도 주문취소 들어가
				orderDAO.updateOrderByOrderNum(state.get(i).getOrderNum());
			}
			
		}
		
	}


}
