package service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import vo.AuthInfo;
import vo.ChangeMemberVO;
import vo.ChangePwVO;
import vo.DeleteVO;
import vo.DeliveryAddressVO;
import vo.MemberVO;
import vo.ReviewVO;
import vo.SellerVO;
import vo.WishListVO;

public interface MemberService {
	
	public abstract int registMember(MemberVO memberVO);
	
	public abstract int registSeller(SellerVO sellerVO);
	
	public abstract String searchIdByEmail(String email);
	
	public abstract String searchIdByPhone(String phone);
	
	public abstract int changePwByEmail(ChangePwVO changePwVO);
	
	public abstract int changePwByPhone(ChangePwVO changePwVO);
	
	public abstract MemberVO searchMemberById(String id);
	
	public abstract SellerVO searchSellerById(String id);
	
	public abstract AuthInfo login(String id, String password);

	public abstract String sendSms(String idd, String receiver, int random, HttpServletRequest req);

	public abstract int idCheck(String id);
	
	public String sendEmail(String subject, String text, String from, String to, String filePath);

	public abstract int updatePwByIdPw(ChangePwVO changePwVO);
	
	public abstract int updateMemberInfoById(ChangeMemberVO changeMemberVO);
	
	public abstract int deleteMemberByIdPw(DeleteVO deleteVO);
	
	public abstract int updateSellerInfoById(ChangeMemberVO changeMemberVO);
	
	public abstract List<DeliveryAddressVO> selectDeliveryAddressById(String id);
	
	public abstract int insertDeliveryAddress(DeliveryAddressVO deliveryAddressVO);
	
	public abstract int deleteDeliveryAddress(DeliveryAddressVO deliveryAddressVO);
	
	public abstract int updateDeliveryAddress(DeliveryAddressVO deliveryAddressVO);
	
	public abstract DeliveryAddressVO selectDeliveryAddressBydaaNameId(DeliveryAddressVO deliveryAddressVO);
	
	public abstract List<SellerVO> searchSellerByIds(String[] proId);
	
	public abstract List<WishListVO> selectWishListByIdProductNum(WishListVO wishListVO);
	
	public abstract List<WishListVO> selectWishListById(WishListVO wishListVO);
	
	public abstract int insertWishList(WishListVO wishListVO);
	
	public abstract int deleteWishListByIdProductNum(WishListVO wishListVO);
	
	public abstract int insertReview(ReviewVO reviewVO);
	
	public abstract List<ReviewVO> selectReviewByOrderNumId(ReviewVO reviewVO);
	
	public abstract MemberVO selectMemberByEmail(String email);
}
