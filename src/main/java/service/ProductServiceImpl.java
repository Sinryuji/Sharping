package service;

import dao.ProductDAO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public class ProductServiceImpl implements ProductService{
	
	private ProductDAO productDAO;
	
	public ProductDAO getProductDAO() {
		return productDAO;
	}

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	
	@Override
	public int uploadProduct(ProductVO productVO) {
		return productDAO.insertProduct(productVO);
	}
	
	@Override
	public int uploadProductDateIsNull(ProductVO productVO) {
		return productDAO.insertProductDateIsNull(productVO);
	}
	
	@Override
	public ProductVO selectProduct(int productNum) {
		return productDAO.selectProductByProductNum(productNum);
	}
	
	@Override
	public int insertOption(OptionVO optionVO) {
		return productDAO.insertOption(optionVO);
	}
	
	@Override
	public int insertOptionDetailIsNull(OptionVO optionVO) {
		return productDAO.insertOptionDetailIsNull(optionVO);
	}
	
	@Override
	public int insertDetailOption(DetailOptionVO detailOptionVO) {
		return productDAO.insertDetailOption(detailOptionVO);
	}

}
