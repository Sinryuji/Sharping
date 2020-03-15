package dao;

import org.mybatis.spring.SqlSessionTemplate;

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
	
}
