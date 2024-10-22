package com.py.api.model.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "EST_PRODUTO")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Produto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7866704577845474130L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_PRODUTO")
	private Long id;

	@Column(name = "DESCRICAO")
	private String descricao;

	@Column(name = "VL_CUSTO_GS")
	private BigDecimal vlCustoGs;

	@Column(name = "VL_CUSTO_RS")
	private BigDecimal vlCustoRs;

	@Column(name = "VL_CUSTO_US")
	private BigDecimal vlCustoUs;

	@Column(name = "VL_CUSTO_MOEDA_BASE")
	private BigDecimal vlCustoMoedaBase;

	@Column(name = "VL_PRECO_ESPECIAL")
	private BigDecimal vlPrecoEspecial;

	@Column(name = "QUANTIDADE_PRECO_ESPECIAL")
	private BigDecimal qtdPrecoEspecial;

	@Column(name = "ORDEM")
	private Long ordem;

	@Column(name = "BO_ATIVO")
	private Boolean ativo;

	@Column(name = "URL_FOTO")
	private String urlFoto;

	@Transient
	private String codigoBarra;

	@Transient
	private BigDecimal existencia;

	@ManyToOne
	@JoinColumn(name = "ID_CLASSIFICACAO", referencedColumnName = "ID_CLASSIFICACAO")
	private ClassificacaoProduto classificacaoProduto;

	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "ID_PRODUTO", referencedColumnName = "ID_PRODUTO")
	private List<Preco> precos;

}
