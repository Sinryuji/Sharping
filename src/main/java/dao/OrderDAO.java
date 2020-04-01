package dao;

import java.util.List;

import vo.BankVO;
import vo.GuestVO;
import vo.OrderListVO;
import vo.OrderVO;
import vo.PayBankVO;
import vo.PayMoneyVO;
import vo.VirtualAccountVO;

public interface OrderDAO {

	public abstract int insertOrder(OrderVO orderVO);

	// 가상계좌 인설트
	public abstract int insertByvirtualAccount(VirtualAccountVO virtualAccountVO);

	// 주문번호 셀렉트
	public abstract OrderVO selectOrderByorderNum(int orderNum);

	// 주문번호 셀렉트
	public abstract List<OrderVO> selectOrderByorderNums(int[] orderNum);

	// 은행코드 셀렉트
	public abstract int selectBankCode(int bankCode);

	// 가상계좌 셀렉트
	public abstract PayBankVO selectByVirtualAccount(int orderNum);

	// 무통장 입금테이블 인설트
	public abstract int insertByPayBank(PayBankVO payBankVO);

	// 무통장입금 테이블 셀렉트
	public abstract PayBankVO selectPayBank(int orderNum);

	// 가상계좌 resp코드 업데이트
	public abstract int updateRespCode(PayMoneyVO payMoney);

	// 무통장입금 결제완료일 업데이트
	public abstract void updatePaydateByPaybank(int result);

	// 주문상태 변경
	public abstract void updateStateByOrder(int success);

	// 뱅크코드 리스트
	public abstract List<BankVO> selectByBankVO();

	public abstract int insertPayCard(OrderVO orderVO);

	public abstract OrderVO selectLatelyOrderNum(String id);

	public abstract OrderVO selectTonameOrderNum(String toName);

	public abstract int insertOrderList(OrderListVO orderListVO);

	public abstract int decrementStockProduct(OrderListVO orderListVO);

	public abstract int decrementStockOption(OrderListVO orderListVO);

	public abstract int selectProductNumByOptionNum(int optionNum);

	public abstract void insertGuest(GuestVO guestvo);

	public abstract List<GuestVO> selectOrderByGuest(GuestVO guestVO);

	public abstract List<OrderListVO> selectOrderListByorderNum(int[] orderNum);

	public abstract List<VirtualAccountVO> selectVirtualAccountVO(int[] orderNum);
	
	public abstract List<Integer> selectPayBankByOrderNum(int[] orderNums);
	
	public abstract List<Integer> selectPayCardByOrderNum(int[] orderNums);
	
	public abstract BankVO selectBankName(int bankCode);

}
