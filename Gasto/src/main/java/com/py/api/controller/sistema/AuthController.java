package com.py.api.controller.sistema;

import java.util.Date;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.sistema.UsuarioMapper;
import com.py.api.model.dto.JwtResponse;
import com.py.api.model.sistema.Empresa;
import com.py.api.model.sistema.JwtRequest;
import com.py.api.model.sistema.Licencia;
import com.py.api.model.sistema.Usuario;
import com.py.api.security.JwtUtilService;
import com.py.api.security.UserDetailsServiceImpl;
import com.py.api.service.sistema.EmpresaService;
import com.py.api.service.sistema.LicenciaService;
import com.py.api.service.sistema.UsuarioService;

import lombok.AllArgsConstructor;

@RestController
@CrossOrigin
@RequestMapping({ "/api/auth" })
@AllArgsConstructor
public class AuthController {

	private AuthenticationManager authenticationManager;

	private UserDetailsServiceImpl userDetailsServiceImpl;

	private JwtUtilService jwtUtilService;

	private UsuarioMapper usuarioMapper;

	private LicenciaService licenciaService;

	private UsuarioService usuarioService;

	private EmpresaService empresaService;

	@PostMapping(value = "/login")
	public ResponseEntity<?> login(@RequestBody JwtRequest authenticationRequest) throws Exception {
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
					authenticationRequest.getUsername(), authenticationRequest.getPassword()));
		} catch (Exception e) {
//			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Usuario y/o Contraseña Invalidos");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Usuario y/o Contraseña Invalidos");
		}

		final UserDetails userDetails = userDetailsServiceImpl.loadUserByUsername(authenticationRequest.getUsername());

		Usuario usuario = usuarioMapper.findByLoginAndSenha(authenticationRequest.getUsername(),
				userDetails.getPassword());
		usuario.setDtUltimoLogin(new Date());
		usuario = usuarioService.save(usuario);
		Licencia licencia = licenciaService.licenciaValida();
		Empresa empresa = empresaService.findEmpresa();

		final String token = jwtUtilService.generateToken(userDetails);
		return ResponseEntity.ok(new JwtResponse(token, usuario, licencia, empresa));
	}

}
