package com.py.api.service.sistema;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.exception.AppException;
import com.py.api.mapper.sistema.CotacaoMapper;
import com.py.api.model.sistema.Cotacao;
import com.py.api.model.sistema.ItemCotacao;
import com.py.api.repository.sistema.CotacaoRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class CotacaoService {

	private CotacaoRepository cotacaoRepository;
	private CotacaoMapper cotacaoMapper;

	public Cotacao save(Cotacao cotacao, String usuario) {
		cotacao.setUsuario(usuario);
		cotacao.setDtCotacao(LocalDateTime.now());

		for (ItemCotacao item : cotacao.getItens()) {
			item.setId(null);
			item.setCotacao(cotacao);
		}
		return cotacaoRepository.save(cotacao);
	}

	public Cotacao findCotacaoAtual() {
		Cotacao cotacao = cotacaoMapper.findCotacaoAtual();
		if (cotacao == null) {
			throw new AppException("No fue cargada la Cotización");
		}

		return cotacao;
	}

	public List<Cotacao> findByCondition(String condition) {
		return cotacaoMapper.findByCondition(condition);
	}

}