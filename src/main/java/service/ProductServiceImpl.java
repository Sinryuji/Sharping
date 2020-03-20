package service;


import java.util.List;

import dao.ProductDAO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductListVO;

import java.util.HashMap;
import vo.BasketListVO;
import vo.BasketVO;
import vo.ProductVO;
import vo.SearchVO;

public class ProductServiceImpl implements ProductService {

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


	public int insertOption(OptionVO optionVO) {
		return productDAO.insertOption(optionVO);
	}
	
	@Override
	public int insertOptionDetailIsNull(OptionVO optionVO) {
		return productDAO.insertOptionDetailIsNull(optionVO);
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
	
	@Override
	public int insertDetailOption(DetailOptionVO detailOptionVO) {
		return productDAO.insertDetailOption(detailOptionVO);

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
	
	@Override
	public List<ProductListVO> getProductList(SearchVO search) throws Exception {
		return productDAO.getProductList(search);
	}
}
