package com.py.api.model.entity;

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

@Entity
@Table(name = "FIN_CLASSIFICACAO_GASTO")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClassificacaoGasto {

	@Id
	@Column(name = "ID_CLASSIFICACAO_GASTO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "DS_CLASSIFICACAO_GASTO")
	private String descricao;

	@Column(name = "BO_ATIVO")
	private Boolean ativo;

	@ManyToOne
	@JoinColumn(name = "ID_TIPO_GASTO", referencedColumnName = "ID_TIPO_GASTO")
	private TipoGasto tipoGasto;

}