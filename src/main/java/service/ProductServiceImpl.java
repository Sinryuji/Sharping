package service;

import java.util.HashMap;
import java.util.List;

import dao.ProductDAO;
import vo.BasketListVO;
import vo.BasketVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

public class ProductServiceImpl implements ProductService {

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

//	@Override
//	public List<ProductVO> productListById(String id) {
//		return productDAO.selectProductById(id);
//	}

	@Override
	public List<OptionVO> selectOptionByProduct(int productNum) {
		
		return productDAO.selectOptionByProductNum(productNum);
	}
	@Override
	public int selectOptionNum(OptionVO optionVO) {
		
		return productDAO.selectOptionNum(optionVO);
	}
	


	@Override
	public List<BasketListVO> selectBasketList(String id) {
		return productDAO.selectBasketList(id);
	}

	@Override
	public void insertBasket(BasketVO basketVO) {
		productDAO.insertBasket(basketVO);
	}

	@Override
	public void updateCnt(BasketVO basketVO) {
		
		productDAO.updateCnt(basketVO);
	}

	@Override
	public List<BasketListVO> selectBasket(int[] basketNums) {
		return productDAO.selectBasketByOptionNum(basketNums);
	}

	@Override
	public int deleteBasket(int basketNum) {
		
		return productDAO.deleteBasketByBasketNum(basketNum);
	}
	

}
