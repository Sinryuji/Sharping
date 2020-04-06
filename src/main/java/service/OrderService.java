package service;

import java.util.List;

import vo.BankVO;
import vo.GuestVO;
import vo.OrderListVO;
import vo.OrderVO;
import vo.PayBankVO;
import vo.PayMoneyVO;
import vo.VirtualAccountVO;

public interface OrderService {

	public abstract int insertOrder(OrderVO orderVO);
	

	//가상계좌 인설트 
	public abstract int insertByvirtualAccount(VirtualAccountVO virtualAccountVO);
	
	
	//주문번호 셀렉트 
	public abstract OrderVO selectOrderByorderNum(int orderNum);
	
	public abstract List<OrderVO> selectOrderByorderNums(int[] orderNum);
	
	//은행코드 셀렉트
	public abstract int selectBankCode(int bankCode);
	
	//가상계좌 셀렉트
	public abstract PayBankVO selectVirtualAccountByPayNum(int payNum);
	
	//무통장 입금테이블 인설트
	public abstract int insertPayBank(PayBankVO payBankVO);
	
	//무통장입금 테이블 셀렉트
	public abstract PayBankVO selectPayBank(int orderNum);
	
	//가상계좌 resp코드 업데이트
	public abstract int updateRespCode(PayMoneyVO payMoney);
	
	//무통장입금 결제완료일 업데이트
	public abstract void updatePaydateByPaybank(String vaNum);
	
	//주문 상태 변경
	public abstract void updateStateByOrder(int payNum);
	

	public abstract int insertPayCard(OrderVO orderVO);
	
//	public abstract OrderVO selectLatelyOrderNum(String id);
	
	public abstract OrderVO selectLatelyOrderNum(String id);
	
	public abstract OrderVO selectTonameOrderNum(String toName);
	
	public abstract int insertOrderList(OrderListVO orderListVO);
	
	public abstract int decrementStockProduct(OrderListVO orderListVO);
	
	public abstract int decrementStockOption(OrderListVO orderListVO);
	
	public abstract int selectProductNumByOptionNum(int optionNum);
	
	public abstract List<OrderVO> selectOrderById(String id);
	
	public abstract List<OrderListVO> selectOrderListByOrderNum(int orderNum);
	
	public abstract OrderListVO selectOrderListByOlNum(int olNum);
	
	public abstract int updateOrderByOrderNum(int orderNum);
	
	public abstract List<OrderVO> selectOrderSearch(OrderVO orderVO);
	
	public abstract List<OrderVO> selectOrderSort(OrderVO orderVO);
	
	public abstract int selectPayNumConut(int payNum);
	
	public abstract List<OrderVO> selectOrderDate(OrderVO orderVO);
	
	public abstract int updatePayPriceVirtualAccount(VirtualAccountVO virtualAccountVO);
	
	public abstract List<OrderVO> selectOrderByPayNum(int payNum);
	
	public abstract void insertGuest(GuestVO guestVO);
	
	public abstract List<GuestVO> selectOrderByGuest(GuestVO guestVO);
	
	public abstract List<OrderListVO> selectOrderListByorderNum(int[] orderNums);
	
	public abstract List<VirtualAccountVO> selectVirtualAccountVO(int[] orderNum);
	
	public abstract List<Integer> selectPayBankByPayNum(int[] payNums);
	
	public abstract List<Integer> selectPayCardByPayNum(int[] payNums);
	
	public abstract List<BankVO> selectBankCodeList();
	
	public abstract BankVO selectBankName(int bankCode);
	
	// 가상계좌 삭제
	public abstract int deleteVirtualAccount(String vaNum);
	
	// 판매자 페이지에서 주문 상태 제어하기
	public abstract int updateOrderState(OrderVO orderVO);
	
	// 구매수
	public abstract List<OrderListVO> selectBuyCount(int[] optionNums);

}
