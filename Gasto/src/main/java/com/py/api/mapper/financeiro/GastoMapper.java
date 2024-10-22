package com.py.api.mapper.financeiro;

import java.math.BigDecimal;
import java.util.List;

import com.py.api.model.dto.TotalClassificacaoGastoDto;
import com.py.api.model.entity.Gasto;

public interface GastoMapper {

	List<Gasto> findByCondition(String condition);

	List<Gasto> findGastoByCaixa(Long idCaixa);

	List<TotalClassificacaoGastoDto> findTotalGastoByClassificacaoAndCaixa(Long idCaixa);

	List<TotalClassificacaoGastoDto> findTotalGastoPorTipoByCaixa(Long idCaixa);

	BigDecimal findValorTotalGastoByCaixa(Long idCaixa);
}