package service;

import vo.ProductVO;

public interface ProductService {
	
	public abstract ProductVO selectProduct(int productNum);

}
