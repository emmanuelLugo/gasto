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
@Table(name = "VEN_ITEM_VENDA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemVenda implements Serializable {

	private static final long serialVersionUID = 4636639078314955472L;

	@Id
	@Column(name = "ID_ITEM_VENDA")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "VL_PRECO_UNITARIO")
	private BigDecimal vlPreco;

	@Column(name = "VL_PRECO_UNITARIO_ORIGINAL")
	private BigDecimal vlPrecoOriginal;

	@Column(name = "QUANTIDADE")
	private BigDecimal qtd;

	@Column(name = "VL_TOTAL")
	private BigDecimal vlTotal;

	@Column(name = "VL_CUSTO")
	private BigDecimal vlCusto;

	@Column(name = "VL_DESCONTO")
	private BigDecimal vlDesconto;

	@Column(name = "TIPO_PRECO")
	private Long tipoPreco;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "ID_VENDA", referencedColumnName = "ID_VENDA")
	private Venda venda;

	@ManyToOne
	@JoinColumn(name = "ID_PRODUTO", referencedColumnName = "ID_PRODUTO")
	private Produto produto;

}