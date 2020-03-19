package service;

import vo.AdminVO;

public interface AdminService {
	
	public abstract AdminVO searchAdminById(String adminId);
	
	public abstract AdminVO login(String adminId, String adminPassword);

}
