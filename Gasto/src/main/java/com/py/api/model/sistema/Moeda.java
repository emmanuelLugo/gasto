package com.py.api.model.sistema;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "BS_MOEDA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Moeda {

	@Id
	@Column(name = "ID_MOEDA")
	private Long id;

	@Column(name = "DS_MOEDA")
	private String descricao;

	@Column(name = "PRECISAO")
	private Long precisao;

}