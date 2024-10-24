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

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Table(name = "FIN_GASTO")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Gasto {

	@Id
	@Column(name = "ID_GASTO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "DS_GASTO")
	private String descricao;

	@Column(name = "VL_GASTO")
	private BigDecimal vlGasto;

	@Column(name = "DT_GASTO")
	private LocalDateTime dtGasto;

	@Column(name = "USUARIO")
	private String usuario;

	@Column(name = "BO_CANCELADO")
	private Boolean cancelado;

	@Column(name = "USUARIO_CANCELAMENTO")
	private String usuarioCancelamento;

	@Column(name = "DT_CANCELAMENTO")
	private LocalDateTime dtCancelamento;

	@ManyToOne
	@JoinColumn(name = "ID_CLASSIFICACAO", referencedColumnName = "ID_CLASSIFICACAO_GASTO")
	private ClassificacaoGasto classificacaoGasto;

	@ManyToOne
	@JoinColumn(name = "ID_CAIXA", referencedColumnName = "ID_CAIXA")
	private Caixa caixa;

}