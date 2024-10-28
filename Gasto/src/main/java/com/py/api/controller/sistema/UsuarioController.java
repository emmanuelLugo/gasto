package com.py.api.controller.sistema;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.sistema.UsuarioMapper;
import com.py.api.model.sistema.Usuario;
import com.py.api.service.sistema.UsuarioService;

import lombok.AllArgsConstructor;

@RestController
@CrossOrigin
@RequestMapping({ "/api/usuario", "/api/user" })
@AllArgsConstructor
public class UsuarioController {

	private UsuarioService usuarioService;
	private UsuarioMapper usuarioMapper;

	@PostMapping(value = "/registrar")
	public ResponseEntity<?> registrar(@RequestBody Usuario usuario) {
		try {
			usuario = usuarioService.saveOrUpdate(usuario);
			return ResponseEntity.ok(usuario);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		}
	}

	@GetMapping("/findByCondition")
	public ResponseEntity<List<Usuario>> findCondition(@RequestParam String condition) {
		List<Usuario> usuarios = usuarioMapper.findByCondition(condition);
		return ResponseEntity.ok(usuarios);
	}
	
	@PutMapping("/alteraSenha")
	public ResponseEntity<?> alteraSenha(@RequestParam Long idUsuario, @RequestParam String novaSenha){
		usuarioService.alteraSenha(idUsuario, novaSenha);
		return ResponseEntity.ok("OK");
	}

}
