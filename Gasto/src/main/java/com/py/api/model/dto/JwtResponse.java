package com.py.api.model.dto;

import com.py.api.model.sistema.Empresa;
import com.py.api.model.sistema.Licencia;
import com.py.api.model.sistema.Usuario;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class JwtResponse {

	private final String jwttoken;
	private final Usuario usuario;
	private final Licencia licencia;
	private final Empresa empresa;

}
