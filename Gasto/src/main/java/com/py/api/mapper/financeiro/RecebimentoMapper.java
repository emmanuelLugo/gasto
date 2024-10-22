package com.py.api.mapper.financeiro;

import java.util.List;
import com.py.api.model.entity.Recebimento;

public interface RecebimentoMapper {
	List<Recebimento> findByCondition(String condition);
	
	List<Recebimento> findRecebimentosByContaReceber(Long idConta);

}