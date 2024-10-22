package com.py.api.model.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.py.api.model.sistema.Moeda;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "FIN_ENTRADA_CAIXA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EntradaCaixa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_ENTRADA_CAIXA")
	private Long id;

	@Column(name = "OBS_ENTRADA")
	private String observacao;

	@ManyToOne
	@JoinColumn(name = "ID_MOEDA", referencedColumnName = "ID_MOEDA")
	private Moeda moeda;

	@Column(name = "VL_ENTRADA")
	private BigDecimal vlEntrada;

	@Column(name = "DT_ENTRADA")
	private Date dtEntrada;

	@Column(name = "USUARIO")
	private String usuario;

	@Column(name = "BO_CANCELADO")
	private Boolean cancelado;

	@Column(name = "DT_CANCELAMENTO")
	private Date dtCancelamento;

	@Column(name = "USUARIO_CANCELAMENTO")
	private String usuarioCancelamento;

	@ManyToOne
	@JoinColumn(name = "ID_CAIXA", referencedColumnName = "ID_CAIXA")
	private Caixa caixa;


}