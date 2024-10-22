package com.py.api.mapper.financeiro;

import java.util.List;
import com.py.api.model.entity.MovimentoCaixa;

public interface MovimentoCaixaMapper {
	List<MovimentoCaixa> findByCondition(String condition);

}