package com.py.api.mapper.financeiro;

import java.util.List;
import com.py.api.model.entity.Caixa;

public interface CaixaMapper {
	List<Caixa> findByCondition(String condition);

}