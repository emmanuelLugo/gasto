package com.py.api.model.sistema;

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
import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "BS_ITEM_COTACAO")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemCotacao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_ITEM_COTACAO")
	private Long id;

	@NotNull
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "ID_COTACAO", referencedColumnName = "ID_COTACAO")
	private Cotacao cotacao;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "ID_MOEDA", referencedColumnName = "ID_MOEDA")
	private Moeda moeda;

	@NotNull
	@Column(name = "VL_FATURACAO")
	private BigDecimal vlFaturacao;

	@NotNull
	@Column(name = "VL_FINANCERO")
	private BigDecimal vlFinancero;

//	@NotNull
//	@Column(name = "BO_ATIVO")
//	private Boolean isAtivo;

}
