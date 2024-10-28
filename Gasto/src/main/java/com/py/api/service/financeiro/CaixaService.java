package com.py.api.service.financeiro;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.mapper.financeiro.CaixaMapper;
import com.py.api.model.entity.Caixa;
import com.py.api.repository.financeiro.CaixaRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class CaixaService {

	private CaixaRepository caixaRepository;
	private CaixaMapper caixaMapper;

	public Caixa save(Caixa caixa) {
		return caixaRepository.save(caixa);
	}

	public Caixa atualizaStatusCaixa(Long idCaixa) {
		Caixa caixa = caixaRepository.findOneById(idCaixa);
		if (caixa.getIsAberto()) {
			caixa.setIsAberto(false);
			caixa.setDtFechamento(LocalDateTime.now());
		} else {
			caixa.setIsAberto(true);
		}

		return caixaRepository.save(caixa);
	}

	public List<Caixa> findByCondition(String condition) {
		return caixaMapper.findByCondition(condition);
	}

	public List<Caixa> findByConditionOrderByAbertos(String condition) {
		return caixaMapper.findByConditionOrderByAbertos(condition);
	}

	public List<Caixa> findCaixasAbertas() {
		return caixaMapper.findCaixasAbertas();
	}

}