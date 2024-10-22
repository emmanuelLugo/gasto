package com.py.api.model.dto;

import java.math.BigDecimal;
import java.util.List;

import com.py.api.model.entity.Gasto;

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
public class GastoDto {
	List<Gasto> gastos;
	BigDecimal vlTotal = BigDecimal.ZERO;
	List<TotalClassificacaoGastoDto> classificacoes;

}
