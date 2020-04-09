package service;


import java.util.List;

import vo.BasketListVO;
import vo.BasketVO;
import vo.DeclProductVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.OrderListVO;
import vo.OrderProductVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.SearchVO;

public interface ProductService {

	public abstract int uploadProduct(ProductVO productVO);
	
	public abstract int uploadProductDateIsNull(ProductVO productVO);

	public abstract ProductVO selectProduct(int productNum);
	
	public abstract List<ProductVO> selectProducts(int[] productNums);
	
	public abstract List<DetailOptionVO> selectDetailOption(int productNum);
	
	public abstract List<ProductVO> productListById(String id);
	
	public abstract int selectOptionNum(OptionVO optionVO);
	
	public abstract OptionVO selectOptionByOptionNum(int optionNum);
	
	//장바구니에서 뽑아오는 옵션vo
	public abstract List<OptionVO> selectOptionByOptionNumList(int[] optionNums);
	
	public abstract int selectOptionLevelMaxByProductNum(int productNum);

	public abstract int insertOption(OptionVO optionVO);
	
	public abstract int insertOptionDetailIsNull(OptionVO optionVO);
	
	public abstract int insertDetailOption(DetailOptionVO detailOptionVO);
	
	public abstract List<ProductVO> getProductList(SearchVO search) throws Exception;


//	public abstract List<ProductVO> productListById(String id);
	
	public abstract List<BasketListVO> selectBasketList(String id);
	
	
	public abstract List<OptionVO> selectOptionByProduct(int productNum);
	
	public abstract void insertBasket(BasketVO basketVO);
	
	public abstract void updateCnt(BasketVO basketVO);
	
	public abstract List<BasketListVO> selectBasket(int[] basketNums);
	
	public abstract int deleteBasket(int basketNum);

	public abstract int updateProductByProductNum(ProductVO productVO);
	
	public abstract int updateProductByProductNumDateIsNull(ProductVO productVO);
	
	public abstract int deleteProductByProductNum(ProductVO productVO);
	
	public abstract int deleteDetailOption(int doNum);
	
	public abstract int selectMaxDoNumByProductNum(int productNum);
	
	public abstract List<OptionVO> selectOptionAll();
	
	public abstract int deleteOptionOneByDoNum(int doNum);
	
	public abstract int deleteOptionTwoByDoNum(int doNum);
	
	public abstract int deleteOptionThreeByDoNum(int doNum);
	
	public abstract int deleteOptionByDoNum(int doNum);
	
	public abstract int deleteOptionByOptionNum(int optionNum);
	
	public abstract List<OptionVO> selectOptionByOptionOneNum (OptionVO optionVO);
	
	public abstract List<OptionVO> selectOptionByOptionTwoNum (OptionVO optionVO);
	
	public abstract DetailOptionVO selectDetailOptionByOptionOneNum (OptionVO optionVO);
	
	public abstract DetailOptionVO selectDetailOptionByOptionTwoNum (OptionVO optionVO);
	
	public abstract int updateProductDisplayByProductNum (ProductVO productVO);
	
	public abstract int deleteSelectProductByProductNum (ProductVO productVO);
	
	public abstract DetailOptionVO selectDetailOptionByDoNum (int doNum);
	
	// 카테고리번호로 상품들 가져오기
	public abstract List<ProductVO> selectProductByCategoryNum (int[] categoryNums);
	
	// 상품들 카테고리 번호 수정하기
	public abstract int updateProductByCategoryNumZero (int productNum);
	public abstract List<OrderProductVO> selectOrderBySellerId(OrderProductVO orderProductVO);
	
	public abstract OrderVO selectDeliveryInfoById(String id);
	
	// 가장 최근 등록한 상품의 프로덕트넘 봅아오기
	public abstract int selectLatelyProductNum(String id);
	
	// 로우넘 없이 프로덕트 리스트 뽑아오기
	public abstract List<ProductVO> getProductListTotal (SearchVO searchVO);
	
	// 아이디로 프로덕트 리스트 뽑아오기(페이징용)
	public abstract List<ProductVO> selectProductByIdPaging (ProductVO productVO);
	// 상품 신고하기
	public abstract int insertDeclProduct(DeclProductVO declProductVO);

}
