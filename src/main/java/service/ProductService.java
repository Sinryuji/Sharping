package service;

import java.util.HashMap;
import java.util.List;

import vo.BasketListVO;
import vo.BasketVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public interface ProductService {

	public abstract ProductVO selectProduct(int productNum);

	public abstract List<DetailOptionVO> selectDetailOption(int productNum);

//	public abstract List<ProductVO> productListById(String id);
	
	public abstract List<BasketListVO> selectBasketList(String id);
	
	public abstract int selectOptionNum(OptionVO optionVO);
	
	public abstract List<OptionVO> selectOptionByProduct(int productNum);
	
	public abstract void insertBasket(BasketVO basketVO);
	
	public abstract void updateCnt(BasketVO basketVO);
	
	public abstract List<BasketListVO> selectBasket(int[] basketNums);
	
	public abstract int deleteBasket(int basketNum);

}
