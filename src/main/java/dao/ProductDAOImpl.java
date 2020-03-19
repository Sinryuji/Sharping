package dao;

import org.mybatis.spring.SqlSessionTemplate;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.ProductVO;

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
		
}
