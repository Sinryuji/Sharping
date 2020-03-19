package dao;

import java.util.HashMap;
import java.util.List;

import vo.BasketListVO;
import vo.BasketVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public interface ProductDAO {

	public abstract ProductVO selectProductByProductNum(int productNum);

	public abstract List<DetailOptionVO> selectDetailOptionByProductNum(int productNum);

//	public abstract List<ProductVO> selectProductById(String id);
	
	public abstract List<OptionVO> selectOptionByProductNum(int productNum);
	
//	public abstract OptionVO selectOptionByProductNum(int productNum);
	
	public abstract int selectOptionNum(OptionVO optionVO);
	
	public abstract List<BasketListVO> selectBasketList(String id);

	public abstract void insertBasket(BasketVO basketVO);
	
	public abstract void updateCnt(BasketVO basketVO);
	
	public abstract List<BasketListVO> selectBasketByOptionNum(int[] basketNums);
	
	public abstract int deleteBasketByBasketNum(int basketNum);
	

}
