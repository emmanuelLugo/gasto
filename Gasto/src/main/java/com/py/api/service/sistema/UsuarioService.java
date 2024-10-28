package com.py.api.service.sistema;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.model.sistema.Usuario;
import com.py.api.repository.sistema.UsuarioRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class UsuarioService {

	private UsuarioRepository usuarioRepository;

	private PasswordEncoder passwordEncoder;

	public Usuario saveOrUpdate(Usuario usuario) {
		usuario.setSenha(passwordEncoder.encode(usuario.getSenha()));
		return usuarioRepository.save(usuario);
	}

	public void alteraSenha(Long idUsuario, String novaSenha) {
		Usuario usuario = usuarioRepository.findById(idUsuario).get();
		usuario.setSenha(passwordEncoder.encode(novaSenha));
		usuarioRepository.save(usuario);
	}

	public Usuario save(Usuario usuario) {
		return usuarioRepository.save(usuario);
	}
}
