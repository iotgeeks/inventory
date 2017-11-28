package org.iotgeeks.controller;

import java.util.List;

import org.iotgeeks.entity.IotGeekAdmin;
import org.iotgeeks.service.IIotGeekAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("iotgeek")
public class IotGeekAdminController {
	@Autowired
	private IIotGeekAdminService iotGeekAdminService;

	// Fetch all unit types
	@GetMapping("admin")
	public ResponseEntity<List<IotGeekAdmin>> getAllIotGeekAdmin() {
		List<IotGeekAdmin> list = iotGeekAdminService.getAllIotGeekAdmin();
		return new ResponseEntity<List<IotGeekAdmin>>(list, HttpStatus.OK);
	}

}
