package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.BankVO;
import vo.GuestVO;
import vo.OrderListVO;
import vo.OrderVO;
import vo.PayBankVO;
import vo.PayMoneyVO;
import vo.VirtualAccountVO;

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

	@Override //가상계좌 인설트
	public int insertByvirtualAccount(VirtualAccountVO virtualAccountVO) {
		return sqlSessionTemplate.insert("orderDAO.insertVirtualAccount",virtualAccountVO);
	}

	@Override //주문 셀렉트
	public OrderVO selectOrderByorderNum(int orderNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectOrder", orderNum);
	}
	@Override //은행 셀렉트
	public int selectBankCode(int bankCode) {
		return sqlSessionTemplate.selectOne("orderDAO.selectBankCode", bankCode);
	}

	@Override //가상계좌 셀렉트
	public PayBankVO selectByVirtualAccount(int payNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectByVirtualAccount", payNum);
	}

	@Override //무통장 인설트
	public int insertByPayBank(PayBankVO payBankVO) {
		return sqlSessionTemplate.insert("orderDAO.insertPayBank", payBankVO);
	}

	@Override //무통장 셀렉트
	public PayBankVO selectPayBank(int orderNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectPayBank", orderNum);
	}

	@Override //응답코드
	public int updateRespCode(PayMoneyVO payMoney) {
		return sqlSessionTemplate.update("orderDAO.updateRespCode", payMoney);
	}

	@Override //결제완료일 
	public void updatePaydateByPaybank(String vaNum) {
		sqlSessionTemplate.update("orderDAO.updatepayDate",vaNum);
	}
	
	@Override //주문상태변경
	public void updateStateByOrder(int payNum) {
		sqlSessionTemplate.update("orderDAO.updateState", payNum);
	}

	@Override
	public List<BankVO> selectBankCodeList() {
		return sqlSessionTemplate.selectList("orderDAO.selectBankCodeList");
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
	public OrderVO selectTonameOrderNum(String toName) {
		return sqlSessionTemplate.selectOne("orderDAO.selectTonameOrderNum", toName);
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
	
	@Override
	public List<OrderVO> selectOrderById(String id) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderById", id);
	}
	
	@Override
	public List<OrderListVO> selectOrderListByOrderNum(int orderNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderListByOrderNum", orderNum);
	}
	
	@Override
	public OrderListVO selectOrderListByOlNum(int olNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectOrderListByOlNum", olNum);
	}
	
	@Override
	public int updateOrderByOrderNum(int orderNum) {
		return sqlSessionTemplate.update("orderDAO.updateOrderByOrderNum", orderNum);
	}
	
	@Override
	public List<OrderVO> selectOrderSearch(OrderVO orderVO) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderSearch", orderVO);
	}
	
	@Override
	public List<OrderVO> selectOrderSort(OrderVO orderVO) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderSort", orderVO);
	}
	
	@Override
	public int selectPayNumConut(int payNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectPayNumCount", payNum);
	}
	
	@Override
	public List<OrderVO> selectOrderDate(OrderVO orderVO) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderDate", orderVO);
	}
	
	@Override
	public int updatePayPriceVirtualAccount(VirtualAccountVO virtualAccountVO) {
		return sqlSessionTemplate.update("orderDAO.updatePayPriceVirtualAccount", virtualAccountVO);
	}
	
	@Override
	public List<OrderVO> selectOrderByPayNum(int payNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderByPayNum", payNum);
	}

	@Override
	public void insertGuest(GuestVO guestvo) {
				sqlSessionTemplate.insert("orderDAO.insertGuest", guestvo);
		
	}

	@Override
	public List<GuestVO> selectOrderByGuest(GuestVO guestVO) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderByGuest",guestVO);
	}

	@Override
	public List<OrderListVO> selectOrderListByorderNum(int[] orderNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderListByorderNum",orderNum);
	}

	@Override
	public List<VirtualAccountVO> selectVirtualAccountVO(int[] orderNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectVirtualAccountVO",orderNum);
	}

	@Override
	public List<OrderVO> selectOrderByorderNums(int[] orderNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderByorderNums",orderNum);
	}

	@Override
	public List<Integer> selectPayBankByPayNum(int[] payNums) {
		return sqlSessionTemplate.selectList("orderDAO.selectPayBankByPayNum",payNums);
	}

	@Override
	public List<Integer> selectPayCardByPayNum(int[] payNums) {
		return sqlSessionTemplate.selectList("orderDAO.selectPayCardByPayNum",payNums);
	}

	@Override
	public BankVO selectBankName(int bankCode) {
		return sqlSessionTemplate.selectOne("orderDAO.selectBankName",bankCode);
	}
	
	@Override
	public int deleteVirtualAccount(String vaNum) {
		return sqlSessionTemplate.delete("orderDAO.deleteVirtualAccount", vaNum);
	}

	@Override
	public int updateOrderState(OrderVO orderVO) {
		return sqlSessionTemplate.update("orderDAO.updateOrderState", orderVO);
	}
	
	@Override
	public List<OrderListVO> selectBuyCount(int[] optionNums) {
		return sqlSessionTemplate.selectList("orderDAO.selectBuyCount", optionNums);
	}

	@Override
	public List<OrderVO> selectOrderAll() {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderAll");
	}

	@Override
	public List<VirtualAccountVO> selectAllVirtualAccountVO(int paynum) {
		return sqlSessionTemplate.selectList("orderDAO.selectAllVirtualAccountVO",paynum);
	}

	@Override
	public List<OrderVO> selectOrderAllState(String state) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderAllState",state);
	}

}
