package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;


import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductListVO;

import vo.BasketListVO;
import vo.BasketVO;

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
		return sqlSessionTemplate.insert("optionDAO.insertOption" , optionVO);
	}
	
	
	@Override
	public int insertOptionDetailIsNull(OptionVO optionVO) {
		return sqlSessionTemplate.insert("optionDAO.insertOptionDetailIsNull" , optionVO);
	}
	
	@Override
	public int insertDetailOption(DetailOptionVO detailOptionVO) {
		return sqlSessionTemplate.insert("optionDAO.insertDetailOption" , detailOptionVO);
	}
	
	@Override
	public List<ProductListVO> getProductList(SearchVO search) {
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

}
