package com.py.api.service.financeiro;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.AllArgsConstructor;
import com.py.api.model.entity.Recebimento;
import com.py.api.repository.financeiro.RecebimentoRepository;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class RecebimentoService {

	private RecebimentoRepository recebimentoRepository;

	public Recebimento save(Recebimento recebimento) {
		return recebimentoRepository.save(recebimento);
	}

}