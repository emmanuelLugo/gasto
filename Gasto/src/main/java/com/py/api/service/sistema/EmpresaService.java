package com.py.api.service.sistema;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.mapper.sistema.EmpresaMapper;
import com.py.api.model.sistema.Empresa;
import com.py.api.repository.sistema.EmpresaRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class EmpresaService {

	private EmpresaRepository empresaRepository;
	private EmpresaMapper empresaMapper;

	public Empresa save(Empresa empresa) {
		return empresaRepository.save(empresa);
	}

	public Empresa findEmpresa() {
		return empresaMapper.findEmpresa();
	}

}