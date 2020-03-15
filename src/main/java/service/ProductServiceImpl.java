package service;

import dao.ProductDAO;
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
	
	

}
