package com.py.api.service.financeiro;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.exception.AppException;
import com.py.api.model.entity.Caixa;
import com.py.api.model.entity.ContaReceber;
import com.py.api.model.entity.MovimentoCaixa;
import com.py.api.model.entity.Recebimento;
import com.py.api.repository.financeiro.ContaReceberRepository;
import com.py.api.repository.financeiro.RecebimentoRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class ContaReceberService {

	private ContaReceberRepository contaReceberRepository;

	private RecebimentoRepository recebimentoRepository;

	private CaixaService caixaService;

	private MovimentoCaixaService movimentoCaixaService;

	public ContaReceber saveRecebimentoContaReceber(ContaReceber contaReceber) throws AppException {
//		Caixa caixa = caixaService.caixaABerto();

		for (Recebimento recebimento : contaReceber.getItens()) {
			if (recebimento.getId() == null) {
				recebimento.setDtRecebimento(LocalDateTime.now());
				recebimento = recebimentoRepository.save(recebimento);

//				MovimentoCaixa mc = MovimentoCaixa.byRecebimento(recebimento, caixa);
//				movimentoCaixaService.save(mc);
//				caixaService.atualizaValoresCaixa(caixa.getId());
			}
		}

		contaReceber = contaReceberRepository.save(contaReceber);

		return contaReceber;

	}

}