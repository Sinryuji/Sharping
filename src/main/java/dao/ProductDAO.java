package dao;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public interface ProductDAO {
	
	public abstract int insertProduct(ProductVO productVO);
	
	public abstract int insertProductDateIsNull(ProductVO productVO);
	
	public abstract ProductVO selectProductByProductNum(int productNum);
	
	public abstract int insertOption(OptionVO optionVO);
	
	public abstract int insertOptionDetailIsNull(OptionVO optionVO);
	
	public abstract int insertDetailOption(DetailOptionVO detailOptionVO);
		
	

}
