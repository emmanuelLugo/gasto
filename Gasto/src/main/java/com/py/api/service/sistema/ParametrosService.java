package com.py.api.service.sistema;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.mapper.sistema.ParametrosMapper;
import com.py.api.model.entity.Parametros;
import com.py.api.repository.sistema.ParametrosRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class ParametrosService {

	private ParametrosRepository parametrosRepository;
	private ParametrosMapper parametrosMapper;

	public Parametros save(Parametros parametros) {
		return parametrosRepository.save(parametros);
	}

	public Parametros findParametros(String chave) {
		return parametrosMapper.findParametroByChave(chave);
	}

}