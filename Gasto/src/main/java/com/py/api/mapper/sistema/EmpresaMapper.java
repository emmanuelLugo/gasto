package com.py.api.mapper.sistema;

import java.util.List;

import com.py.api.model.sistema.Empresa;

public interface EmpresaMapper {
	List<Empresa> findByCondition(String condition);
	
	Empresa findEmpresa();

}