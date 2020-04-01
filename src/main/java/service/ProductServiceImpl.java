package service;


import java.util.List;

import org.springframework.stereotype.Service;

import dao.ProductDAO;
import vo.BasketListVO;
import vo.BasketVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.OrderProductVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.SearchVO;
import vo.SellerVO;

@Service
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
	public List<ProductVO> getProductList(SearchVO search) throws Exception {
		return productDAO.getProductList(search);
	}

	@Override
	public List<OptionVO> selectOptionByOptionNumList(int[] optionNum) {
		return productDAO.selectOptionByOptionNumList(optionNum);
	}

	@Override
	public List<ProductVO> selectProducts(int[] productNums) {
		return productDAO.selectProducts(productNums);
	}

	
	@Override
	public int updateProductByProductNum(ProductVO productVO) {
		return productDAO.updateProductByProductNum(productVO);
	}
	
	@Override
	public int updateProductByProductNumDateIsNull(ProductVO productVO) {
		return productDAO.updateProductByProductNumDateIsNull(productVO);
	}
	
	@Override
	public int deleteProductByProductNum(ProductVO productVO) {
		return productDAO.deleteProductByproductNum(productVO);
	}
	
	@Override
	public int deleteDetailOption(int doNum) {
		return productDAO.deleteDetailOption(doNum);
	}
	
	@Override
	public int selectMaxDoNumByProductNum(int productNum) {
		return productDAO.selectMaxDoNumByProductNum(productNum);
	}
	
	@Override
	public List<OptionVO> selectOptionAll() {
		return productDAO.selectOptionAll();
	}
	
	@Override
	public int deleteOptionOneByDoNum(int doNum) {
		return productDAO.deleteOptionOneByDoNum(doNum);
	}
	
	@Override
	public int deleteOptionTwoByDoNum(int doNum) {
		return productDAO.deleteOptionTwoByDoNum(doNum);
	}
	
	@Override
	public int deleteOptionThreeByDoNum(int doNum) {
		return productDAO.deleteOptionThreeByDoNum(doNum);
	}
	
	@Override
	public int deleteOptionByDoNum(int doNum) {
		return productDAO.deleteOptionByDoNum(doNum);
	}

	@Override
	public int deleteOptionByOptionNum(int optionNum) {
		return productDAO.deleteOptionByOptionNum(optionNum);
	}
	
	@Override
	public List<OptionVO> selectOptionByOptionOneNum(OptionVO optionVO) {
		return productDAO.selectOptionByOptionOneNum(optionVO);
	}
	
	@Override
	public List<OptionVO> selectOptionByOptionTwoNum(OptionVO optionVO) {
		return productDAO.selectOptionByOptionTwoNum(optionVO);
	}
	
	@Override
	public DetailOptionVO selectDetailOptionByOptionOneNum(OptionVO optionVO) {
		return productDAO.selectDetailOptionByOptionOneNum(optionVO);
	}
	
	@Override
	public int updateProductDisplayByProductNum(ProductVO productVO) {
		return productDAO.updateProductDisplayByProductNum(productVO);
	}
	
	@Override
	public int deleteSelectProductByProductNum(ProductVO productVO) {
		return productDAO.deleteSelectProductByProductNum(productVO);
	}
	
	@Override
	public DetailOptionVO selectDetailOptionByOptionTwoNum(OptionVO optionVO) {
		return productDAO.selectDetailOptionByOptionTwoNum(optionVO);
	}

	@Override
	public DetailOptionVO selectDetailOptionByDoNum(int doNum) {
		return productDAO.selectDetailOptionByDoNum(doNum);
		
	}
	public List<OrderProductVO> selectOrderBySellerId(String id) {
		return productDAO.selectOrderBySellerId(id);
	}
	
	@Override
	public OrderVO selectDeliveryInfoById(String id) {
		return productDAO.selectDeliveryInfoById(id);
	}
	
	@Override
	public List<ProductVO> selectProductByCategoryNum(int[] categoryNums) {
		return productDAO.selectProductByCategoryNum(categoryNums);
	}
	
	@Override
	public int updateProductByCategoryNumZero(int productNum) {
		return productDAO.updateProductByCategoryNumZero(productNum);
	}
}
