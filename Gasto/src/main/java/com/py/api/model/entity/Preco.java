package com.py.api.model.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "EST_PRECO")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Preco implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -111204123038454925L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_PRECO")
	private Long id;

	@Column(name = "CODIGO_BARRA")
	private String codigoBarra;

	@Column(name = "BO_PRINCIPAL")
	private Boolean principal;

	@Column(name = "BO_ATIVO")
	private Boolean ativo;

	@Column(name = "QTD_PRECO_1")
	private BigDecimal qtdPreco1;

	@Column(name = "VL_PRECO_VENDA_1")
	private BigDecimal vlPrecoVenda1;

	@Column(name = "QTD_PRECO_2")
	private BigDecimal qtdPreco2;

	@Column(name = "VL_PRECO_VENDA_2")
	private BigDecimal vlPrecoVenda2;

	@Column(name = "QTD_PRECO_3")
	private BigDecimal qtdPreco3;

	@Column(name = "VL_PRECO_VENDA_3")
	private BigDecimal vlPrecoVenda3;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "ID_PRODUTO", referencedColumnName = "ID_PRODUTO")
	private Produto produto;

}
