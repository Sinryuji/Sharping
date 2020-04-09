package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.BasketListVO;
import vo.BasketVO;
import vo.DeclProductVO;
import vo.DetailOptionVO;
import vo.OptionVO;
import vo.OrderListVO;
import vo.OrderProductVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.SearchVO;

public class ProductDAOImpl implements ProductDAO{

	private SqlSessionTemplate sqlSessionTemplate;

	public ProductDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int insertProduct(ProductVO productVO) {
		return sqlSessionTemplate.insert("productDAO.insertProduct", productVO);
	}
	
	@Override
	public int insertProductDateIsNull(ProductVO productVO) {
		return sqlSessionTemplate.insert("productDAO.insertProductDateIsNull", productVO);
	}
	
	@Override
	public ProductVO selectProductByProductNum(int productNum) {

		return sqlSessionTemplate.selectOne("productDAO.selectProductByProductNum", productNum);
	}

	@Override
	public List<DetailOptionVO> selectDetailOptionByProductNum(int productNum) {
		return sqlSessionTemplate.selectList("productDAO.selectDetailOptionByProductNum", productNum);
	}
	
	@Override
	public List<ProductVO> selectProductById(String id) {
		return sqlSessionTemplate.selectList("productDAO.selectProductById", id);
	}

	public List<OptionVO> selectOptionByProductNum(int productNum) {
		
		return sqlSessionTemplate.selectList("productDAO.selectOptionByProductNum",productNum);

	}
	
	@Override
	public int selectOptionNum(OptionVO optionVO) {

		return sqlSessionTemplate.selectOne("productDAO.selectOptionNum", optionVO);
	}
	
	@Override
	public OptionVO selectOptionByOptionNum(int optionNum) {
		return sqlSessionTemplate.selectOne("productDAO.selectOptionByOptionNum", optionNum);
	}
	
	@Override
	public int selectOptionLevelMaxByProductNum(int productNum) {
		return sqlSessionTemplate.selectOne("selectOptionLevelMaxByProductNum", productNum);
	}

	@Override
	public int insertOption(OptionVO optionVO) {
		return sqlSessionTemplate.insert("productDAO.insertOption" , optionVO);
	}
	
	
	@Override
	public int insertOptionDetailIsNull(OptionVO optionVO) {
		return sqlSessionTemplate.insert("productDAO.insertOptionDetailIsNull" , optionVO);
	}
	
	@Override
	public int insertDetailOption(DetailOptionVO detailOptionVO) {
		return sqlSessionTemplate.insert("productDAO.insertDetailOption" , detailOptionVO);
	}
	
	@Override
	public List<ProductVO> getProductList(SearchVO search) {
		return sqlSessionTemplate.selectList("productDAO.getProductList", search);

	}

	@Override
	public List<BasketListVO> selectBasketList(String id) {
		
		return sqlSessionTemplate.selectList("productDAO.selectBasketList",id);
	}

	@Override
	public void insertBasket(BasketVO basketVO) {
		
		sqlSessionTemplate.insert("productDAO.insertBasket",basketVO);
		
	}

	@Override
	public void updateCnt(BasketVO basketVO) {
		sqlSessionTemplate.update("productDAO.updateCnt", basketVO);
	}

	@Override
	public List<BasketListVO> selectBasketByOptionNum(int[] basketNums) {
		return sqlSessionTemplate.selectList("productDAO.selectBasketByOptionNum", basketNums);
	}
	
	@Override
	public int deleteBasketByBasketNum(int basketNum) {
		return sqlSessionTemplate.delete("productDAO.deleteBasketByBasketNum", basketNum);
	}

	public List<OptionVO> selectOptionByOptionNumList(int[] optionNums) {
		return sqlSessionTemplate.selectList("productDAO.selectOptionByOptionNumList",optionNums);
	}

	@Override
	public List<ProductVO> selectProducts(int[] productNums) {
		return sqlSessionTemplate.selectList("productDAO.selectProducts" , productNums);
	}


	public int updateProductByProductNum(ProductVO productVO) {
		return sqlSessionTemplate.update("productDAO.updateProductByProductNum", productVO);
	}
	
	@Override
	public int updateProductByProductNumDateIsNull(ProductVO productVO) {
		return sqlSessionTemplate.update("productDAO.updateProductByProductNumDateIsNull", productVO);
	}
	
	@Override
	public int deleteProductByproductNum(ProductVO productVO) {
		return sqlSessionTemplate.delete("productDAO.deleteProductByProductNum", productVO);
	}
	
	@Override
	public int deleteDetailOption(int doNum) {
		return sqlSessionTemplate.delete("productDAO.deleteDetailOption", doNum);
	}
	
	@Override
	public int selectMaxDoNumByProductNum(int productNum) {
		return sqlSessionTemplate.selectOne("productDAO.selectMaxDoNumByProductNum", productNum);
	}
	
	@Override
	public List<OptionVO> selectOptionAll() {
		return sqlSessionTemplate.selectList("productDAO.selectOptionAll");
	}
	
	@Override
	public int deleteOptionOneByDoNum(int doNum) {
		return sqlSessionTemplate.delete("productDAO.deleteOptionOneByDoNum", doNum);
	}
	
	@Override
	public int deleteOptionTwoByDoNum(int doNum) {
		return sqlSessionTemplate.delete("productDAO.deleteOptionTwoByDoNum", doNum);
	}

	
	@Override
	public int deleteOptionThreeByDoNum(int doNum) {
		return sqlSessionTemplate.delete("productDAO.deleteOptionThreeByDoNum", doNum);
	}

	@Override
	public int deleteOptionByDoNum(int doNum) {
		return sqlSessionTemplate.delete("productDAO.deleteOptionByDoNum", doNum);
	}
	
	@Override
	public int deleteOptionByOptionNum(int optionNum) {
		return sqlSessionTemplate.delete("productDAO.deleteOptionByOptionNum", optionNum);
	}
	
	@Override
	public List<OptionVO> selectOptionByOptionOneNum(OptionVO optionVO) {
		return sqlSessionTemplate.selectList("productDAO.selectOptionByOptionOneNum", optionVO);
	}
	
	@Override
	public List<OptionVO> selectOptionByOptionTwoNum(OptionVO optionVO) {
		return sqlSessionTemplate.selectList("productDAO.selectOptionByOptionTwoNum", optionVO);
	}
	
	@Override
	public DetailOptionVO selectDetailOptionByOptionOneNum(OptionVO optionVO) {
		return sqlSessionTemplate.selectOne("productDAO.selectDetailOptionByOptionOneNum", optionVO);
	}
	
	@Override
	public int updateProductDisplayByProductNum(ProductVO productVO) {
		return sqlSessionTemplate.update("productDAO.updateProductDisplayByProductNum", productVO);
	}
	
	@Override
	public int deleteSelectProductByProductNum(ProductVO productVO) {
		return sqlSessionTemplate.delete("productDAO.deleteSelectProductByProductNum", productVO);
	}
	
	@Override
	public DetailOptionVO selectDetailOptionByOptionTwoNum(OptionVO optionVO) {
		return sqlSessionTemplate.selectOne("productDAO.selectDetailOptionByOptionTwoNum", optionVO);
	}
	
	@Override
	public DetailOptionVO selectDetailOptionByDoNum(int doNum) {
		return sqlSessionTemplate.selectOne("productDAO.selectDetailOptionByDoNum", doNum);
	}
	
	@Override
	public List<ProductVO> selectProductByCategoryNum(int[] categoryNums) {
		return sqlSessionTemplate.selectList("productDAO.selectProductByCategoryNum", categoryNums);
	}
	
	@Override
	public int updateProductByCategoryNumZero(int productNum) {
		return sqlSessionTemplate.update("productDAO.updateProductByCategoryNumZero", productNum);
	}
	public List<OrderProductVO> selectOrderBySellerId(OrderProductVO orderProductVO) {
		return sqlSessionTemplate.selectList("productDAO.selectOrderBySellerId", orderProductVO);
	}
	
	@Override
	public OrderVO selectDeliveryInfoById(String id) {
		return sqlSessionTemplate.selectOne("productDAO.selectDeliveryInfoById", id);
	}

	@Override
	public int selectLatelyProductNum(String id) {
		return sqlSessionTemplate.selectOne("productDAO.selectLatelyProductNum", id);
	}
	
	@Override
	public List<ProductVO> getProductListTotal(SearchVO searchVO) {
		return sqlSessionTemplate.selectList("productDAO.getProductListTotal", searchVO);
	}
	public int insertDeclProduct(DeclProductVO declProductVO) {
		return sqlSessionTemplate.insert("productDAO.insertDeclProduct", declProductVO);
	}
	
	@Override
	public List<ProductVO> selectProductByIdPaging(ProductVO productVO) {
		return sqlSessionTemplate.selectList("productDAO.selectProductByIdPaging", productVO);
	}
}
