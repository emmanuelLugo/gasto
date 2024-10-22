package com.py.api.model.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.py.api.model.serializer.ContaReceberSerializer;
import com.py.api.model.sistema.Moeda;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "FIN_RECEBIMENTO")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Recebimento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_RECEBIMENTO")
	private Long id;

	@Column(name = "VL_RECEBIMENTO")
	private BigDecimal vlRecebimento;

	@Column(name = "VL_JURO")
	private BigDecimal vlJuro;

	@Column(name = "COTACAO")
	private BigDecimal cotacao;

	@Column(name = "DT_RECEBIMENTO")
	private LocalDateTime dtRecebimento;

	@Column(name = "NR_DOCUMENTO")
	private Long nrDocumento;

	@Column(name = "USUARIO")
	private String usuario;

	@Column(name = "OBSERVACAO")
	private String observacao;
	
	@Column(name = "BO_IS_TROCO")
	private Boolean isTroco;
	
	@ManyToOne
	@JoinColumn(name = "ID_FORMA_RECEBIMENTO", referencedColumnName = "ID_FORMA_RECEBIMENTO")
	private FormaRecebimento formaRecebimento;

	@ManyToOne
	@JoinColumn(name = "ID_MOEDA", referencedColumnName = "ID_MOEDA")
	private Moeda moeda;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "ID_VENDA", referencedColumnName = "ID_VENDA")
	private Venda venda;

	@ManyToOne
	@JoinColumn(name = "ID_CAIXA", referencedColumnName = "ID_CAIXA")
	private Caixa caixa;

	@JsonSerialize(using = ContaReceberSerializer.class)
	@ManyToOne
	@JoinColumn(name = "ID_CONTA_RECEBER", referencedColumnName = "ID_CONTA_RECEBER")
	private ContaReceber contaReceber;
	

}