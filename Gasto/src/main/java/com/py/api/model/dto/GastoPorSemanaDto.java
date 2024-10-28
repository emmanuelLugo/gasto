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
public class GastoPorSemanaDto {
	private BigDecimal vlTotal = BigDecimal.ZERO;
	private Long diasDaSemana;
	private String diasDaSemanaString;
}
