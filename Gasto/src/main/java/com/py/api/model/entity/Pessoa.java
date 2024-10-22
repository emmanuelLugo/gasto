package com.py.api.model.entity;

import java.io.Serializable;

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

@Entity
@Table(name = "BS_PESSOA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Pessoa implements Serializable {

	private static final long serialVersionUID = 7886545570958148714L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_PESSOA")
	private Long id;

	@Column(name = "NOME")
	private String nome;

	@Column(name = "RUC")
	private String ruc;

	@Column(name = "BO_ATIVO")
	private Boolean ativo;

	@Column(name = "LOCALIZACAO")
	private String localizacao;

	@Column(name = "OBSERVACAO")
	private String observacao;

	@Column(name = "TELEFONE")
	private String telefone;

}