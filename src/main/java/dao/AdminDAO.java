package dao;

import vo.AdminVO;

public interface AdminDAO {

	public abstract AdminVO selectAdminById(String adminId);
	
}
