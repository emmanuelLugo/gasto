package com.py.api.model.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
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

import com.py.api.model.sistema.Cotacao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "VEN_VENDA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Venda implements Serializable {

	private static final long serialVersionUID = 3997084442636956255L;

	@Id
	@Column(name = "ID_VENDA")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "DT_VENDA")
	private LocalDateTime dtVenda;

	@Column(name = "DT_MODIFICACAO")
	private LocalDateTime dtModificacao;

	@Column(name = "BO_FINALIZADO")
	private Boolean finalizado;

	@Column(name = "NR_MESA")
	private Long nrMesa;

	@Column(name = "BO_COBRO_RAPIDO")
	private Boolean cobroRapido;

	@Column(name = "VL_TOTAL")
	private BigDecimal vlTotal;

	@Column(name = "VL_TOTAL_DESCONTO_ITEM")
	private BigDecimal vlTotalDescontoItem;

	@Column(name = "VL_NAO_RECEBIDO")
	private BigDecimal vlNaoRecebido;

	@Column(name = "VL_NAO_DEVOLVIDO")
	private BigDecimal vlNaoDevolvido;

	@Column(name = "BO_CANCELADO")
	private Boolean cancelado;

	@Column(name = "DT_CANCELAMENTO")
	private LocalDateTime dtCancelamento;

	@Column(name = "MOTIVO_CANCELAMENTO")
	private String motivoCancelamento;

	@ManyToOne
	@JoinColumn(name = "ID_PESSOA", referencedColumnName = "ID_PESSOA")
	private Pessoa pessoa;

	@ManyToOne
	@JoinColumn(name = "ID_COTACAO", referencedColumnName = "ID_COTACAO")
	private Cotacao cotacao;

	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "ID_VENDA", referencedColumnName = "ID_VENDA")
	private List<ItemVenda> itens;

	@OneToMany(mappedBy = "venda", cascade = CascadeType.ALL)
	private List<Recebimento> recebimentos = new ArrayList<>();

	public void calculaDesconto() {
		for (ItemVenda iv : itens) {
			if (iv.getVlPrecoOriginal().doubleValue() < iv.getVlPreco().doubleValue()) {
				BigDecimal vlPrecoSemDesconto = iv.getVlPrecoOriginal().multiply(iv.getQtd());
				iv.setVlDesconto(vlPrecoSemDesconto.subtract(iv.getVlPreco()));
			}
		}
	}

}