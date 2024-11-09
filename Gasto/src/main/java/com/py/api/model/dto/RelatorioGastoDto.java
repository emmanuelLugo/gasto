package com.py.api.model.dto;

import java.math.BigDecimal;

import com.github.pagehelper.PageInfo;
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
public class RelatorioGastoDto {
	private PageInfo<Gasto> relatorio;
	private BigDecimal vlTotal = BigDecimal.ZERO;
}
