package com.py.api.service.registro;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.api.mapper.registro.PessoaMapper;
import com.py.api.model.dto.GenericResponseEntity;
import com.py.api.model.entity.Pessoa;
import com.py.api.repository.registro.PessoaRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class PessoaService {

	private PessoaRepository pessoaRepository;
	private PessoaMapper pessoaMapper;

	public Pessoa save(Pessoa pessoa) {
		return pessoaRepository.save(pessoa);
	}

	public GenericResponseEntity<?> findByConditionPage(String condition, int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize, true);
		Page<Pessoa> list = pessoaMapper.findByCondition(condition);
		return new GenericResponseEntity<PageInfo<Pessoa>>("Consulta con exito", 200, new PageInfo<Pessoa>(list));
	}

}