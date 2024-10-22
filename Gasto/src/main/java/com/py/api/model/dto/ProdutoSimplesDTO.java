package com.py.api.model.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.py.api.model.entity.Preco;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProdutoSimplesDTO {

	private Long id;
	private Long codigo;
	private Long codigoCombo;
	private String descricao;
	private String unidadeMedida;
	private BigDecimal vlCustoGs;
	private BigDecimal vlCustoRs;
	private BigDecimal vlCustoUs;
	private BigDecimal existencia;
	private BigDecimal qtdMinimaEst;
	private Boolean controlaStock;
	private String fotoPath;
	private Long iva;
	private Boolean ativo;
	private Boolean bloquearVendaBajoCosto;
	private Boolean favorito;
	private Boolean classAtivo;

	private Boolean habilitarCanjePunto;
	private Long qtdPuntoPorVenda;
	private Long qtdPuntoNecesarioCanje;
	
	
	private List<Preco> precos = new ArrayList<>();
	
}
