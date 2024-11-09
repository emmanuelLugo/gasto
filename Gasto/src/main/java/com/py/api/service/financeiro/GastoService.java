package com.py.api.service.financeiro;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.api.exception.AppException;
import com.py.api.mapper.financeiro.GastoMapper;
import com.py.api.model.dto.GastoDto;
import com.py.api.model.dto.GastoPorSemanaDto;
import com.py.api.model.dto.RelatorioGastoDto;
import com.py.api.model.dto.TotalClassificacaoGastoDto;
import com.py.api.model.entity.Caixa;
import com.py.api.model.entity.Gasto;
import com.py.api.repository.financeiro.CaixaRepository;
import com.py.api.repository.financeiro.GastoRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class GastoService {

	private GastoRepository gastoRepository;
	private GastoMapper gastoMapper;
	private CaixaRepository caixaRepository;

	public Gasto save(Gasto gasto, String usuario) {
		if (gasto.getDtGasto() == null) {
			gasto.setDtGasto(LocalDateTime.now());
		} else {
			LocalDateTime currentDate = gasto.getDtGasto().toLocalDate().atTime(LocalTime.now());
			gasto.setDtGasto(currentDate);
		}
		gasto.setCancelado(false);
		gasto.setUsuario(usuario);

		return gastoRepository.save(gasto);
	}

	public List<Gasto> findByCondition(String condition) {
		List<Gasto> gastos = gastoMapper.findByCondition(condition);
		return gastos;
	}

	public PageInfo<Gasto> findGastoSimplesByConditionPageInfo(String condition, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Gasto> gastos = gastoMapper.findByCondition(condition);
		return new PageInfo<>(gastos);
	}

	public Gasto cancelaGastoById(Long id, String usuario) {
		Optional<Gasto> gastoOpt = gastoRepository.findById(id);
		if (gastoOpt.isPresent()) {
			Gasto gasto = gastoOpt.get();
			if (gasto.getCancelado()) {
				throw new AppException("El gasto ya fue cancelado, vuelva a consultar");
			}

			gasto.setCancelado(true);
			gasto.setDtCancelamento(LocalDateTime.now());
			gasto.setUsuarioCancelamento(usuario);
			gasto = gastoRepository.save(gasto);
			return gasto;

		}
		throw new AppException("El gasto no existe, vuelva a consultar");
	}

	public GastoDto findGastoByCaixa(Long idCaixa, Boolean mostraValorSemGastar) {
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
		if (vlSobrante.doubleValue() > 0 && mostraValorSemGastar) {
			TotalClassificacaoGastoDto clasificacionDto = new TotalClassificacaoGastoDto();
			clasificacionDto.setIdClassificacao(0L);
			clasificacionDto.setVlTotal(vlSobrante);
			vlTotal = vlTotal.add(vlSobrante);
			BigDecimal porcentaje = vlSobrante.multiply(BigDecimal.valueOf(100)).divide(vlTotal, 2,
					RoundingMode.HALF_UP);

			clasificacionDto.setVlPorcentagem(porcentaje);
			clasificacionDto.setDescricao("SIN GASTAR");
			classificacoesDto.add(clasificacionDto);
		}

		for (Map.Entry<Long, BigDecimal> entry : totalPorClasificacion.entrySet()) {
			Long idClasificacion = entry.getKey();
			BigDecimal totalClasificacion = entry.getValue();
			String descricao = descricaoPorClasificacion.get(idClasificacion);

			BigDecimal porcentaje = totalClasificacion.multiply(BigDecimal.valueOf(100)).divide(vlTotal, 2,
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

	public List<GastoPorSemanaDto> findTotalGastoPorSemana() {
		return gastoMapper.findTotalGastoPorSemana();
	}

	public RelatorioGastoDto findRelatorioGastoByCondition(String condition, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Gasto> gastos = gastoMapper.findByCondition(condition);
		PageInfo<Gasto> listGastos = new PageInfo<>(gastos);
		BigDecimal vlTotalGasto = gastoMapper.findValorTotalGastoByCondition(condition);
		RelatorioGastoDto dto = new RelatorioGastoDto();
		dto.setRelatorio(listGastos);
		dto.setVlTotal(vlTotalGasto);
		return dto;
	}

}