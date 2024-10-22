package com.py.api.service.financeiro;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.model.entity.ClassificacaoGasto;
import com.py.api.repository.financeiro.ClassificacaoGastoRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class ClassificacaoGastoService {

	private ClassificacaoGastoRepository classificacaoGastoRepository;

	public ClassificacaoGasto save(ClassificacaoGasto classificacaoGasto) {
		return classificacaoGastoRepository.save(classificacaoGasto);
	}

}