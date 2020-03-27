package service;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import dao.AdminDAO;
import exception.IdPasswordNotMatchingException;
import vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminDAO adminDAO;
	
	

	public AdminServiceImpl() {
		super();
	}

	public AdminServiceImpl(AdminDAO adminDAO) {
		super();
		this.adminDAO = adminDAO;
	}

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	
	public AdminVO searchAdminById(String adminId) {
		return adminDAO.selectAdminById(adminId);
	}
	
	@Override
	public AdminVO login(String adminId, String adminPassword) {
		AdminVO adminVO = adminDAO.selectAdminById(adminId);

		if (adminVO == null) {
			return null;
		}
		if (!BCrypt.checkpw(adminPassword, adminVO.getAdminPassword())) {
			throw new IdPasswordNotMatchingException();
		} else {
			return new AdminVO(adminVO.getAdminId(), adminVO.getAdminPassword());
		}
	}
}
