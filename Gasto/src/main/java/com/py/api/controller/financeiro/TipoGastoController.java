package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.py.api.mapper.financeiro.TipoGastoMapper;
import com.py.api.model.entity.TipoGasto;
import com.py.api.service.financeiro.TipoGastoService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/tipoGasto" })
@AllArgsConstructor
public class TipoGastoController {

	private TipoGastoService tipoGastoService;

	private TipoGastoMapper tipoGastoMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody TipoGasto tipoGasto) { 
		try {
			tipoGasto = tipoGastoService.save(tipoGasto);
			return ResponseEntity.ok(tipoGasto);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		}
	}

	@GetMapping("/findByCondition")
	public ResponseEntity<List<TipoGasto>> findByCondition(@RequestParam String condition) {
		List<TipoGasto> tipoGastos = tipoGastoMapper.findByCondition(condition);
		return ResponseEntity.ok(tipoGastos);
	}
}