package com.py.api.mapper.financeiro;

import java.util.List;
import com.py.api.model.entity.ContaReceber;

public interface ContaReceberMapper {
	List<ContaReceber> findByCondition(String condition);
	
	ContaReceber findById(Long idConta);

}