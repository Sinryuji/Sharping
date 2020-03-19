package dao;


import java.util.List;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

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


}
