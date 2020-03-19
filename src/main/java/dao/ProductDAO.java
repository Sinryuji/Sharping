package dao;

import java.util.List;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public interface ProductDAO {
	
	public abstract ProductVO selectProductByProductNum(int productNum);
	
	public abstract List<DetailOptionVO> selectDetailOptionByProductNum(int productNum);
	
	public abstract List<ProductVO> selectProductById(String id);
	
	public abstract int selectOptionNum(OptionVO optionVO);
	
	public abstract OptionVO selectOptionByOptionNum(int optionNum);
	
	public abstract int selectOptionLevelMaxByProductNum(int productNum);

}
