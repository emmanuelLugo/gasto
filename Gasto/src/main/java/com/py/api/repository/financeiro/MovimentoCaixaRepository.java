package com.py.api.repository.financeiro;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.entity.Caixa;
import com.py.api.model.entity.EntradaCaixa;
import com.py.api.model.entity.Gasto;
import com.py.api.model.entity.MovimentoCaixa;

@Repository
public interface MovimentoCaixaRepository extends JpaRepository<MovimentoCaixa, Long> {

	MovimentoCaixa findOneByEntradaCaixa(EntradaCaixa entradaCaixa);
	MovimentoCaixa findOneByGasto(Gasto gasto);
	List<MovimentoCaixa> findByCaixa(Caixa caixa);
}