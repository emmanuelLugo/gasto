package com.py.api.service.financeiro;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.model.entity.FormaRecebimento;
import com.py.api.repository.financeiro.FormaRecebimentoRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class FormaRecebimentoService {

	private FormaRecebimentoRepository formaRecebimentoRepository;

	public FormaRecebimento save(FormaRecebimento formaRecebimento) {
		return formaRecebimentoRepository.save(formaRecebimento);
	}

}