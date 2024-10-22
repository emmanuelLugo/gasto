package com.py.api.service.financeiro;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.model.entity.Caixa;
import com.py.api.model.entity.EntradaCaixa;
import com.py.api.model.entity.MovimentoCaixa;
import com.py.api.repository.financeiro.EntradaCaixaRepository;
import com.py.api.repository.financeiro.MovimentoCaixaRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class EntradaCaixaService {

	private EntradaCaixaRepository entradaCaixaRepository;
	private CaixaService caixaService;
	private MovimentoCaixaRepository movimentoCaixaRepository;

	public EntradaCaixa save(EntradaCaixa entradaCaixa, String usuario) throws Exception {
//		Caixa caixa = caixaService.caixaABerto();
		entradaCaixa.setDtEntrada(new Date());
		entradaCaixa.setCancelado(false);
		entradaCaixa.setUsuario(usuario);
//		entradaCaixa.setCaixa(caixa);

		entradaCaixa = entradaCaixaRepository.save(entradaCaixa);

//		MovimentoCaixa mov = MovimentoCaixa.byEntrada(entradaCaixa, caixa);
//		movimentoCaixaRepository.save(mov);

//		caixaService.atualizaValoresCaixa(entradaCaixa.getCaixa().getId());
		return entradaCaixa;
	}

	public EntradaCaixa cancelaEntradaById(Long id, String usuario) throws Exception {
		EntradaCaixa entradaCaixa = entradaCaixaRepository.findById(id).get();

		if (entradaCaixa.getCancelado()) {
			throw new Exception("La Entrada ya se encuentra cancelada");
		}

		caixaService.caixaABertoById(entradaCaixa.getCaixa().getId());

		entradaCaixa.setCancelado(true);
		entradaCaixa.setDtCancelamento(new Date());
		entradaCaixa.setUsuarioCancelamento(usuario);

		entradaCaixaRepository.save(entradaCaixa);

		MovimentoCaixa mov = movimentoCaixaRepository.findOneByEntradaCaixa(entradaCaixa);
		if (mov != null) {
			movimentoCaixaRepository.delete(mov);
		}

//		caixaService.atualizaValoresCaixa(entradaCaixa.getCaixa().getId());
		return entradaCaixa;
	}

}