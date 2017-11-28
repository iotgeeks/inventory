package org.iotgeeks.service;

import java.util.List;

import org.iotgeeks.entity.IotGeekAdmin;
import org.springframework.security.access.annotation.Secured;



public interface IIotGeekAdminService {
	@Secured ({"ROLE_ADMIN"})
	List<IotGeekAdmin> getAllIotGeekAdmin();
    IotGeekAdmin getIotGeekAdminByEmail(String emailId);
}
