package dao;

import java.util.List;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductListVO;

import java.util.HashMap;


import vo.BasketListVO;
import vo.BasketVO;

import vo.ProductVO;
import vo.SearchVO;

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
	

}
