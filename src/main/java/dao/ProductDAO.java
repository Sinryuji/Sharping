package dao;

import java.util.List;

import vo.BasketListVO;
import vo.BasketVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductListVO;
import vo.ProductVO;
import vo.SearchVO;
import vo.SellerVO;

public interface ProductDAO {

	
	public abstract int insertProduct(ProductVO productVO);
	
	public abstract int insertProductDateIsNull(ProductVO productVO);

	public abstract ProductVO selectProductByProductNum(int productNum);
	

	public abstract List<DetailOptionVO> selectDetailOptionByProductNum(int productNum);
	
	public abstract List<ProductVO> selectProductById(String id);
	
	public abstract int selectOptionNum(OptionVO optionVO);
	
	public abstract OptionVO selectOptionByOptionNum(int optionNum);
	
	public abstract int selectOptionLevelMaxByProductNum(int productNum);

	public abstract int insertOption(OptionVO optionVO);
	
	public abstract int insertOptionDetailIsNull(OptionVO optionVO);
	
	public abstract int insertDetailOption(DetailOptionVO detailOptionVO);
	
	//상폼리스트
	public abstract List<ProductListVO> getProductList(SearchVO search) throws Exception;


//	public abstract List<ProductVO> selectProductById(String id);
	
	public abstract List<OptionVO> selectOptionByProductNum(int productNum);
	
//	public abstract OptionVO selectOptionByProductNum(int productNum);
	
	
	public abstract List<BasketListVO> selectBasketList(String id);

	public abstract void insertBasket(BasketVO basketVO);
	
	public abstract void updateCnt(BasketVO basketVO);
	
	public abstract List<BasketListVO> selectBasketByOptionNum(int[] basketNums);
	
	public abstract int deleteBasketByBasketNum(int basketNum);
		
	public abstract int updateProductByProductNum(ProductVO productVO);
	
	public abstract int updateProductByProductNumDateIsNull(ProductVO productVO);
	
	public abstract int deleteProductByproductNum(ProductVO productVO);
	
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
	
	public abstract DetailOptionVO selectDetailOptionByDoNum (int doNum);
	
	public abstract int updateProductDisplayByProductNum (ProductVO productVO);
	
	public abstract int deleteSelectProductByProductNum (ProductVO productVO);
	
	//장바구니에서 뽑아오는 옵션vo List
	public abstract List<OptionVO> selectOptionByOptionNumList(int[] optionNums);
	
	public abstract List<ProductVO> selectProducts(int[] productNums);

}
