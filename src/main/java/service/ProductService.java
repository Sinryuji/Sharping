package service;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public interface ProductService {
	
	public abstract int uploadProduct(ProductVO productVO);
	
	public abstract int uploadProductDateIsNull(ProductVO productVO);
	
	public abstract ProductVO selectProduct(int productNum);

	public abstract int insertOption(OptionVO optionVO);
	
	public abstract int insertOptionDetailIsNull(OptionVO optionVO);
	
	public abstract int insertDetailOption(DetailOptionVO detailOptionVO);
	
	
}
