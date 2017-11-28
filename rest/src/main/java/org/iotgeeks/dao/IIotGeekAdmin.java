package org.iotgeeks.dao;

import java.util.List;

import org.iotgeeks.entity.IotGeekAdmin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IIotGeekAdmin extends JpaRepository<IotGeekAdmin, Integer>{
	@Query("select u from IotGeekAdmin u where u.emailId = ?1")
	List<IotGeekAdmin> findByEmail(String emailId);
}
