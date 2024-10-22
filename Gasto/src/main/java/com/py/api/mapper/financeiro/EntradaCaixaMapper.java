package com.py.api.mapper.financeiro;

import java.util.List;
import com.py.api.model.entity.EntradaCaixa;

public interface EntradaCaixaMapper {
	List<EntradaCaixa> findByCondition(String condition);

}