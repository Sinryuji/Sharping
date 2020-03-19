package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.BasketListVO;
import vo.BasketVO;
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
	public ProductVO selectProductByProductNum(int productNum) {

		return sqlSessionTemplate.selectOne("productDAO.selectProductByProductNum", productNum);
	}
	
	@Override
	public List<DetailOptionVO> selectDetailOptionByProductNum(int productNum) {
		return sqlSessionTemplate.selectList("productDAO.selectDetailOptionByProductNum", productNum);
	}
	
	@Override
	public List<OptionVO> selectOptionByProductNum(int productNum) {
		
		return sqlSessionTemplate.selectList("productDAO.selectOptionByProductNum",productNum);
	}
	
	@Override
	public int selectOptionNum(OptionVO optionVO) {
		return sqlSessionTemplate.selectOne("productDAO.selectOptionNum",optionVO);
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
