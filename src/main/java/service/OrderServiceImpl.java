package service;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
	
	@Override
	public int updateOrderStateTwo(OrderVO orderVO) {
		return orderDAO.updateOrderStateTwo(orderVO);
	}
	
	
	// 배송 완료 된 주문들 상태를 배송 완료로 바꾸는 스케쥴러
	@Scheduled(fixedDelay=1800000)
	public void deliveryCheckScheduled() {
		
		List<OrderVO> list = orderDAO.selectOrderAllState("배송 중");
	
		
		for(int i = 0 ; i < list.size() ; i++) {
			String trackingNum = list.get(i).getTrackingNum();
			System.out.println(trackingNum);
			String trackingCode = list.get(i).getTrackingCode();
			System.out.println(trackingCode);
			int orderNum = list.get(i).getOrderNum();
			String url = "http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+"OIjx4Zjhi1fGysjpq0lfTg"+"&t_code=0"+trackingCode+"&t_invoice="+trackingNum;
			try {
				URL obj = new URL(url);
				HttpURLConnection conn = (HttpURLConnection) obj.openConnection();
				conn.setRequestMethod("GET");
				BufferedReader in = null;
				in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				String line;
				line = in.readLine();
				System.out.println(line);
				JSONParser parser = new JSONParser();
				Object ob = parser.parse(line);
				JSONObject jsonObj = (JSONObject) ob;
				System.out.println(jsonObj.toString());
				JSONObject lastDetail = (JSONObject) jsonObj.get("lastDetail");
				String lastDetailKind = (String) lastDetail.get("kind");
				System.out.println(lastDetailKind);
				if(lastDetailKind.equals("배송완료") || lastDetailKind.equals("배달완료")) {
				
				OrderVO order = orderDAO.selectOrderByorderNum(orderNum);
				order.setState("배송 완료");
				orderDAO.updateOrderStateTwo(order);
				
			}
			}catch (Exception e) {
				
			}
			
		}
		
	}
	
	// 배송 완료된 주문들 일주일 후 구매 확정으로 바꾸는 스케쥴러
	@Scheduled(cron = "0 10 0 * * ?")
	public void buyConfirmScheduled() {
	
		List<OrderVO> list = orderDAO.selectOrderAllState("배송 완료");
		
		for(int i = 0 ; i < list.size() ; i++) {
			
			String trackingNum = list.get(i).getTrackingNum();
			System.out.println(trackingNum);
			String trackingCode = list.get(i).getTrackingCode();
			System.out.println(trackingCode);
			int orderNum = list.get(i).getOrderNum();
			String url = "http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+"Mptc8WkAYQqshH6Q2Zn0Ug"+"&t_code=0"+trackingCode+"&t_invoice="+trackingNum;
			try {
				URL obj = new URL(url);
				HttpURLConnection conn = (HttpURLConnection) obj.openConnection();
				conn.setRequestMethod("GET");
				BufferedReader in = null;
				in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				String line;
				line = in.readLine();
				System.out.println(line);
				JSONParser parser = new JSONParser();
				Object ob = parser.parse(line);
				JSONObject jsonObj = (JSONObject) ob;
				System.out.println(jsonObj.toString());
				JSONObject lastDetail = (JSONObject) jsonObj.get("lastDetail");
				String lastDetailKind = (String) lastDetail.get("kind");
				String lastDetailTimeString = (String) lastDetail.get("timeString");
				System.out.println(lastDetailKind);
				System.out.println(lastDetailTimeString);
				if(lastDetailKind.contains("완료")) {
					
					Calendar cal = Calendar.getInstance();
					
					Calendar cal2 = Calendar.getInstance();
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					Date deliveryCompleteDate =  sdf.parse(lastDetailTimeString);
					
//					String deliveryCompleteDateString = sdf.format(deliveryCompleteDate);
					
					cal.setTime(deliveryCompleteDate);
					cal.add(Calendar.DATE, 7);
					
					cal2.setTime(new Date());
					
					
					String buyConfirmDateString = sdf.format(cal.getTime());
					String currentDateString = sdf.format(cal2.getTime());
					
					System.out.println(buyConfirmDateString);
					System.out.println(currentDateString);
					
					Date buyConfirmDate = sdf.parse(buyConfirmDateString);
					Date currentDate = sdf.parse(currentDateString);
					
					int result = buyConfirmDate.compareTo(currentDate);
					
					if(result <= 0) {
						
						OrderVO order = orderDAO.selectOrderByorderNum(orderNum);
						order.setState("구매 확정");
						orderDAO.updateOrderStateTwo(order);
						
					}
					
				
			}
			}catch (Exception e) {
				
			}
			
		}
		
	}
	
	


}
