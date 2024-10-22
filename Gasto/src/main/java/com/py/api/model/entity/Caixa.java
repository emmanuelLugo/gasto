package com.py.api.model.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression.DateTime;

@Entity
@Table(name = "FIN_CAIXA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Caixa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_CAIXA")
	private Long id;
	
	@Column(name = "OBSERVACAO")
	private String observacao;

	@Column(name = "DT_ABERTURA")
	private Date dtAbertura;

	@Column(name = "BO_ABERTO")
	private Boolean isAberto;

	@Column(name = "DT_FECHAMENTO")
	private Date dtFechamento;

	@Column(name = "VL_CAIXA")
	private BigDecimal vlCaixa;

}