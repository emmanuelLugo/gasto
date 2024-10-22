package com.py.api.controller.sistema;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.sistema.EmpresaMapper;
import com.py.api.model.sistema.Empresa;
import com.py.api.service.sistema.EmpresaService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/empresa" })
@AllArgsConstructor
public class EmpresaController {

	private EmpresaService empresaService;

	private EmpresaMapper empresaMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody Empresa empresa) { 
		try {
			empresa = empresaService.save(empresa);
			return ResponseEntity.ok(empresa);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		}
	}

	@RequestMapping(value = "/findByCondition", method = RequestMethod.GET)
	public ResponseEntity<List<Empresa>> findByCondition(@RequestParam String condition) {
		List<Empresa> empresas = empresaMapper.findByCondition(condition);
		return ResponseEntity.ok(empresas);
	}
}