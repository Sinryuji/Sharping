package dao;

import vo.ProductVO;

public interface ProductDAO {
	
	public abstract ProductVO selectProductByProductNum(int productNum);

}
