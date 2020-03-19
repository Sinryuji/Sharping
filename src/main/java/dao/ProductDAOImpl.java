package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.DetailOptionVO;
import vo.OptionVO;
import vo.OrderVO;
import vo.ProductVO;

public class ProductDAOImpl implements ProductDAO{

	private SqlSessionTemplate sqlSessionTemplate;

	public ProductDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
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
}
