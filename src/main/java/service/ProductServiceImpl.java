package service;

import java.util.List;

import dao.ProductDAO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.OrderVO;
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
	public ProductVO selectProduct(int productNum) {
		return productDAO.selectProductByProductNum(productNum);
	}
	
	@Override
	public List<DetailOptionVO> selectDetailOption(int productNum) {
		return productDAO.selectDetailOptionByProductNum(productNum);
	}

	@Override
	public List<ProductVO> productListById(String id) {
		return productDAO.selectProductById(id);
	}
	
	@Override
	public int selectOptionNum(OptionVO optionVO) {
		return productDAO.selectOptionNum(optionVO);
	}
	
	@Override
	public OptionVO selectOptionByOptionNum(int optionNum) {
		return productDAO.selectOptionByOptionNum(optionNum);
	}
	
	@Override
	public int selectOptionLevelMaxByProductNum(int productNum) {
		return productDAO.selectOptionLevelMaxByProductNum(productNum);
	}
}
