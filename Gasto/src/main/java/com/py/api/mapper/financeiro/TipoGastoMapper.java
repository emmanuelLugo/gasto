package com.py.api.mapper.financeiro;

import java.util.List;
import com.py.api.model.entity.TipoGasto;

public interface TipoGastoMapper {
	List<TipoGasto> findByCondition(String condition);

}