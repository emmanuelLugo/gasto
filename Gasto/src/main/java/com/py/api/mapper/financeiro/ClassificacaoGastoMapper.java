package com.py.api.mapper.financeiro;

import java.util.List;

import com.py.api.model.entity.ClassificacaoGasto;

public interface ClassificacaoGastoMapper {

	List<ClassificacaoGasto> findByCondition(String condition);

	List<ClassificacaoGasto> findByConditionVO(String condition);

}