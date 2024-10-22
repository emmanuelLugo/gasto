package com.py.api.mapper.sistema;

import java.util.List;

import com.py.api.model.sistema.Usuario;

public interface UsuarioMapper {

	Usuario findByLoginAndSenha(String login, String senha);

	List<Usuario> findByCondition(String condition);

}