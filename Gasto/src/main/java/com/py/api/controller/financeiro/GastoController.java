package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.financeiro.GastoMapper;
import com.py.api.model.dto.GastoDto;
import com.py.api.model.dto.TotalClassificacaoGastoDto;
import com.py.api.model.entity.Gasto;
import com.py.api.service.financeiro.GastoService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/gasto" })
@AllArgsConstructor
public class GastoController {

	private GastoService gastoService;
	private GastoMapper gastoMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody Gasto gasto, @RequestHeader("usuario") String usuario) {
		gasto = gastoService.save(gasto, usuario);
		return ResponseEntity.ok(gasto);
	}

	@GetMapping("/findByCondition")
	public ResponseEntity<List<Gasto>> findByCondition(@RequestParam String condition) {
		List<Gasto> gastos = gastoMapper.findByCondition(condition);
		return ResponseEntity.ok(gastos);
	}

	@PostMapping("/cancelaGasto/{id}")
	public ResponseEntity<?> cancelaGasto(@PathVariable Long id, @RequestHeader("usuario") String usuario) {
		Gasto gasto = gastoService.cancelaGastoById(id, usuario);
		return ResponseEntity.ok(gasto);
	}

	@GetMapping("/findGastoByCaixa/{idCaixa}")
	public ResponseEntity<GastoDto> findGastoByCaixa(@PathVariable Long idCaixa) {
		GastoDto gastoDto = gastoService.findGastoByCaixa(idCaixa);
		return ResponseEntity.ok(gastoDto);
	}

	@GetMapping("/findTotalGastoByClassificacao/{idCaixa}")
	public ResponseEntity<List<TotalClassificacaoGastoDto>> findTotalGastoByClassificacao(@PathVariable Long idCaixa) {
		List<TotalClassificacaoGastoDto> list = gastoService.findTotalGastoByClassificacao(idCaixa);
		return ResponseEntity.ok(list);
	}

	@GetMapping("/findTotalGastoPorTipoByCaixa/{idCaixa}")
	public ResponseEntity<GastoDto> findTotalGastoPorTipoByCaixa(@PathVariable Long idCaixa) {
		GastoDto gastoDto = gastoService.findTotalGastoPorTipoByCaixa(idCaixa);
		return ResponseEntity.ok(gastoDto);
	}

}