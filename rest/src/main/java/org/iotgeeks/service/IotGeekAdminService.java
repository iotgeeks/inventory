package org.iotgeeks.service;

import java.util.List;

import org.iotgeeks.dao.IIotGeekAdmin;
import org.iotgeeks.entity.IotGeekAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class IotGeekAdminService implements IIotGeekAdminService {
	@Autowired
	private IIotGeekAdmin iotGeekAdmin;
	public List<IotGeekAdmin> getAllIotGeekAdmin() {
		// TODO Auto-generated method stub
		return iotGeekAdmin.findAll();
	}

	public IotGeekAdmin getIotGeekAdminByEmail(String emailId) {
		// TODO Auto-generated method stub
		return (IotGeekAdmin) iotGeekAdmin.findByEmail(emailId);
	}
	
}
