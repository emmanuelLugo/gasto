package com.py.api.service.financeiro;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.model.entity.TipoGasto;
import com.py.api.repository.financeiro.TipoGastoRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class TipoGastoService {

	private TipoGastoRepository tipoGastoRepository;

	public TipoGasto save(TipoGasto tipoGasto) {
		return tipoGastoRepository.save(tipoGasto);
	}

}