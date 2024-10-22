package com.py.api.model.sistema;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "SYS_LICENCIA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Licencia implements Serializable {

	private static final long serialVersionUID = 1374454165430519065L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_LICENCIA")
	private Long id;

	@Column(name = "SERIE")
	private String serie;

	@Column(name = "BO_ATIVO")
	private boolean ativo;

	@Column(name = "DT_ULTIMO_LOGIN")
	private Date fechaUltimoLogin;

	@Column(name = "DT_EXPIRACAO")
	private Date dtExpiracao;

	@Transient
	private String dtExpiracaoString;

	@Transient
	private Boolean programacao;

	@Transient
	private Long diasAVencer;

}
