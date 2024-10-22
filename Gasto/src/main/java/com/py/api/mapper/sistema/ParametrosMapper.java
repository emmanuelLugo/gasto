package com.py.api.mapper.sistema;

import com.py.api.model.entity.Parametros;

public interface ParametrosMapper {
	Parametros findParametroByChave(String chave);
}