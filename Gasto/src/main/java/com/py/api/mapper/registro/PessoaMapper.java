package com.py.api.mapper.registro;

import com.github.pagehelper.Page;
import com.py.api.model.entity.Pessoa;
public interface PessoaMapper {
	Page<Pessoa> findByCondition(String condition);
}