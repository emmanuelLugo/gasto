package com.py.api.mapper.financeiro;

import java.util.List;
import com.py.api.model.entity.FormaRecebimento;

public interface FormaRecebimentoMapper {
	List<FormaRecebimento> findByCondition(String condition);

}