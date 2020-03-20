package service;


import java.util.List;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductListVO;

import java.util.HashMap;


import vo.BasketListVO;
import vo.BasketVO;

import vo.ProductVO;
import vo.SearchVO;

public interface ProductService {

	public abstract int uploadProduct(ProductVO productVO);
	
	public abstract int uploadProductDateIsNull(ProductVO productVO);

	public abstract ProductVO selectProduct(int productNum);
	
	public abstract List<DetailOptionVO> selectDetailOption(int productNum);
	
	public abstract List<ProductVO> productListById(String id);
	
	public abstract int selectOptionNum(OptionVO optionVO);
	
	public abstract OptionVO selectOptionByOptionNum(int optionNum);
	
	public abstract int selectOptionLevelMaxByProductNum(int productNum);

	public abstract int insertOption(OptionVO optionVO);
	
	public abstract int insertOptionDetailIsNull(OptionVO optionVO);
	
	public abstract int insertDetailOption(DetailOptionVO detailOptionVO);
	
	public abstract List<ProductListVO> getProductList(SearchVO search) throws Exception;


//	public abstract List<ProductVO> productListById(String id);
	
	public abstract List<BasketListVO> selectBasketList(String id);
	
	
	public abstract List<OptionVO> selectOptionByProduct(int productNum);
	
	public abstract void insertBasket(BasketVO basketVO);
	
	public abstract void updateCnt(BasketVO basketVO);
	
	public abstract List<BasketListVO> selectBasket(int[] basketNums);
	
	public abstract int deleteBasket(int basketNum);

}
