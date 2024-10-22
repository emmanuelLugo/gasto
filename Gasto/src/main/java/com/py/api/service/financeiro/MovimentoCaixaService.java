package com.py.api.service.financeiro;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.exception.AppException;
import com.py.api.model.entity.Caixa;
import com.py.api.model.entity.MovimentoCaixa;
import com.py.api.model.entity.Recebimento;
import com.py.api.model.entity.Venda;
import com.py.api.repository.financeiro.MovimentoCaixaRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class MovimentoCaixaService {

	private MovimentoCaixaRepository movimentoCaixaRepository;

	public MovimentoCaixa save(MovimentoCaixa movimentoCaixa) {
		return movimentoCaixaRepository.save(movimentoCaixa);
	}

	public void geraMovimentoCaixaByVenda(Venda venda, Caixa caixa) throws AppException {
		for (Recebimento recebimento : venda.getRecebimentos()) {
			MovimentoCaixa mov = MovimentoCaixa.byRecebimentoVenda(venda, caixa, recebimento);
			movimentoCaixaRepository.save(mov);
		}
	}

}