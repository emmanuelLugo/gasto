package com.py.api.service.financeiro;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.exception.AppException;
import com.py.api.mapper.financeiro.GastoMapper;
import com.py.api.model.dto.GastoDto;
import com.py.api.model.dto.TotalClassificacaoGastoDto;
import com.py.api.model.entity.Caixa;
import com.py.api.model.entity.Gasto;
import com.py.api.model.entity.MovimentoCaixa;
import com.py.api.repository.financeiro.CaixaRepository;
import com.py.api.repository.financeiro.ClassificacaoGastoRepository;
import com.py.api.repository.financeiro.GastoRepository;
import com.py.api.repository.financeiro.MovimentoCaixaRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class GastoService {

	private GastoRepository gastoRepository;
//	private CaixaService caixaService;
	private MovimentoCaixaRepository movimentoCaixaRepository;
	private GastoMapper gastoMapper;
	private ClassificacaoGastoRepository classificacaoGastoRepository;
	private CaixaRepository caixaRepository;

	public Gasto save(Gasto gasto, String usuario) {
//		Caixa caixa = caixaService.caixaABerto();
		Caixa caixa = new Caixa();
		caixa.setId(1L);
		if(gasto.getDtGasto() == null) {
			gasto.setDtGasto(LocalDateTime.now());
		}
//		gasto.setDtGasto(new Date());
		gasto.setCancelado(false);
		gasto.setUsuario(usuario);
		gasto.setCaixa(caixa);

		gasto = gastoRepository.save(gasto);

//		MovimentoCaixa mov = MovimentoCaixa.byGasto(gasto, caixa);
//		movimentoCaixaRepository.save(mov);
//		caixaService.atualizaValoresCaixa(gasto.getCaixa().getId());
		return gasto;
	}

	public List<Gasto> findByCondition(String condition) {
		List<Gasto> gastos = gastoMapper.findByCondition(condition);
		return gastos;
	}

	public Gasto cancelaGastoById(Long id, String usuario) {
		Optional<Gasto> gastoOpt = gastoRepository.findById(id);
		if (gastoOpt.isPresent()) {
			Gasto gasto = gastoOpt.get();
			if (gasto.getCancelado()) {
				throw new AppException("El gasto no existe, vuelva a consultar");
			}

//			caixaService.caixaABertoById(gasto.getCaixa().getId());

			gasto.setCancelado(true);
			gasto.setDtCancelamento(new Date());
			gasto.setUsuarioCancelamento(usuario);
			gasto.setDtCancelamento(new Date());
			gasto = gastoRepository.save(gasto);
			MovimentoCaixa mov = movimentoCaixaRepository.findOneByGasto(gasto);
			if (mov != null) {
				movimentoCaixaRepository.delete(mov);
			}

//			caixaService.atualizaValoresCaixa(gasto.getCaixa().getId());
			return gasto;

		}
		throw new AppException("El gasto no existe, vuelva a consultar");
	}

	public GastoDto findGastoByCaixa(Long idCaixa) {
		Optional<Caixa> caixaSelecionada = caixaRepository.findById(idCaixa);
		BigDecimal vlCaixa = caixaSelecionada.get().getVlCaixa();
		BigDecimal vlTotalGasto = gastoMapper.findValorTotalGastoByCaixa(idCaixa);

		List<Gasto> gastos = gastoMapper.findGastoByCaixa(idCaixa);
		BigDecimal vlSobrante = vlCaixa.subtract(vlTotalGasto);

		Map<Long, BigDecimal> totalPorClasificacion = new HashMap<>();
		Map<Long, String> descricaoPorClasificacion = new HashMap<>();
		BigDecimal vlTotal = BigDecimal.ZERO;

		for (Gasto gasto : gastos) {
			Long idClasificacion = gasto.getClassificacaoGasto().getId();
			BigDecimal valorGasto = gasto.getVlGasto();
			String descricao = gasto.getClassificacaoGasto().getDescricao();
			vlTotal = vlTotal.add(valorGasto);
			totalPorClasificacion.merge(idClasificacion, valorGasto, BigDecimal::add);
			descricaoPorClasificacion.putIfAbsent(idClasificacion, descricao);
		}
		List<TotalClassificacaoGastoDto> classificacoesDto = new ArrayList<>();

		// GENERA RESTANTE
		if (vlSobrante.doubleValue() > 0) {
			TotalClassificacaoGastoDto clasificacionDto = new TotalClassificacaoGastoDto();
			clasificacionDto.setIdClassificacao(0L);
			clasificacionDto.setVlTotal(vlSobrante);
			BigDecimal porcentaje = vlSobrante.multiply(BigDecimal.valueOf(100)).divide(vlCaixa, 2,
					RoundingMode.HALF_UP);

			clasificacionDto.setVlPorcentagem(porcentaje);
			clasificacionDto.setDescricao("SIN GASTAR");
			classificacoesDto.add(clasificacionDto);
		}

		for (Map.Entry<Long, BigDecimal> entry : totalPorClasificacion.entrySet()) {
			Long idClasificacion = entry.getKey();
			BigDecimal totalClasificacion = entry.getValue();
			String descricao = descricaoPorClasificacion.get(idClasificacion);

			BigDecimal porcentaje = totalClasificacion.multiply(BigDecimal.valueOf(100)).divide(vlCaixa, 2,
					RoundingMode.HALF_UP);

			TotalClassificacaoGastoDto clasificacionDto = new TotalClassificacaoGastoDto();
			clasificacionDto.setIdClassificacao(idClasificacion);
			clasificacionDto.setVlTotal(totalClasificacion);
			clasificacionDto.setVlPorcentagem(porcentaje);
			clasificacionDto.setDescricao(descricao);

			classificacoesDto.add(clasificacionDto);
		}

		GastoDto dto = new GastoDto();
		dto.setGastos(gastos);
		dto.setVlTotal(vlTotal);
		dto.setClassificacoes(classificacoesDto);
		return dto;
	}

	public List<TotalClassificacaoGastoDto> findTotalGastoByClassificacao(Long idCaixa) {
		List<TotalClassificacaoGastoDto> listClassificacoes = gastoMapper
				.findTotalGastoByClassificacaoAndCaixa(idCaixa);

		return listClassificacoes;

	}

	public GastoDto findTotalGastoPorTipoByCaixa(Long idCaixa) {
		BigDecimal vlTotalGasto = gastoMapper.findValorTotalGastoByCaixa(idCaixa);
		List<TotalClassificacaoGastoDto> listTotais = gastoMapper.findTotalGastoPorTipoByCaixa(idCaixa);

		for (TotalClassificacaoGastoDto totalClassificacaoGastoDto : listTotais) {
			BigDecimal vlPorcentagem = totalClassificacaoGastoDto.getVlTotal().multiply(BigDecimal.valueOf(100))
					.divide(vlTotalGasto, 2, RoundingMode.HALF_UP);
			totalClassificacaoGastoDto.setVlPorcentagem(vlPorcentagem);
		}

		GastoDto dto = new GastoDto();
//		dto.setGastos(listTotais);
		dto.setVlTotal(vlTotalGasto);
		dto.setClassificacoes(listTotais);

		return dto;
	}

}