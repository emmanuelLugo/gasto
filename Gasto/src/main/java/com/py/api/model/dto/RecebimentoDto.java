package com.py.api.model.dto;

import com.py.api.model.entity.Venda;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RecebimentoDto {

	private Venda venda;
	private String valor;
	private Boolean troco;
	
	
}
