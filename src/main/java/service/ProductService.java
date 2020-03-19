package service;

import java.util.List;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public interface ProductService {
	
	public abstract ProductVO selectProduct(int productNum);
	
	public abstract List<DetailOptionVO> selectDetailOption(int productNum);
	
	public abstract List<ProductVO> productListById(String id);
	
	public abstract int selectOptionNum(OptionVO optionVO);
	
	public abstract OptionVO selectOptionByOptionNum(int optionNum);
	
	public abstract int selectOptionLevelMaxByProductNum(int productNum);

}
