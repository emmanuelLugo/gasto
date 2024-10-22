package com.py.api.model.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.py.api.model.sistema.Moeda;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "FIN_CONTA_RECEBER")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ContaReceber {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_CONTA_RECEBER")
	private Long id;

	@Column(name = "HISTORICO")
	private String historico;

	@Column(name = "NR_DOCUMENTO")
	private String nrDocumento;

	@Column(name = "VL_DOCUMENTO")
	private BigDecimal vlDocumento;

	@Column(name = "VL_JUROS")
	private BigDecimal vlJuros;

	@Column(name = "VL_DESCONTOS")
	private BigDecimal vlDescontos;

	@Column(name = "VL_RECEBIDO")
	private BigDecimal vlRecebido;

	@Column(name = "VL_ARECEBER")
	private BigDecimal vlAReceber;

	@Column(name = "VL_DEVOLUCAO")
	private BigDecimal vlDevolucao;

	@Column(name = "DT_CADASTRO")
	private Date dtCadastro;

	@Column(name = "DT_EMISSAO")
	private Date dtEmissao;

	@Column(name = "DT_VENCIMENTO")
	private Date dtVencimento;

	@Column(name = "SITUACAO")
	private String situacao;

	@Column(name = "BO_AVISTA")
	private Boolean avista;

	@Column(name = "BO_CANCELADO")
	private Boolean cancelado;

	@Column(name = "DT_CANCELAMENTO")
	private Date dtCancelamento;

	@Column(name = "RESPONSAVEL_CANCELAMENTO")
	private String responsavelCancelamento;
	
	@ManyToOne
	@JoinColumn(name = "ID_PESSOA", referencedColumnName = "ID_PESSOA")
	private Pessoa pessoa;

	@ManyToOne
	@JoinColumn(name = "ID_MOEDA", referencedColumnName = "ID_MOEDA")
	private Moeda moeda;
	
	@ManyToOne
	@JoinColumn(name = "ID_VENDA", referencedColumnName = "ID_VENDA")
	private Venda venda;
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "ID_CONTA_RECEBER", referencedColumnName = "ID_CONTA_RECEBER")
	private List<Recebimento> itens;
	
	public void calculaVlSaldo(BigDecimal vlRecebido) {
		if (this.vlRecebido == null)
			this.vlRecebido = BigDecimal.ZERO;
		this.vlRecebido = this.vlRecebido.add(vlRecebido);
		this.vlAReceber = this.vlAReceber.subtract(this.vlRecebido);
	}

}