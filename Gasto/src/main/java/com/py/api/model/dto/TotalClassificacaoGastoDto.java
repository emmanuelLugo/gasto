package com.py.api.model.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TotalClassificacaoGastoDto {
	private Long idClassificacao;
	private String descricao;
	private BigDecimal vlTotal;
	private BigDecimal vlPorcentagem;

}
