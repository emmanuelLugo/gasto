package com.py.api.mapper.sistema;

import java.util.List;

import com.py.api.model.sistema.Cotacao;

public interface CotacaoMapper {
	List<Cotacao> findByCondition(String condition);

	Cotacao findCotacaoAtual();

}