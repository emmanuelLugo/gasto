package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.financeiro.ClassificacaoGastoMapper;
import com.py.api.model.entity.ClassificacaoGasto;
import com.py.api.service.financeiro.ClassificacaoGastoService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/classificacaoGasto" })
@AllArgsConstructor
public class ClassificacaoGastoController {

	private ClassificacaoGastoService classificacaoGastoService;
	private ClassificacaoGastoMapper classificacaoGastoMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody ClassificacaoGasto classificacaoGasto) {
		try {
			classificacaoGasto = classificacaoGastoService.save(classificacaoGasto);
			return ResponseEntity.ok(classificacaoGasto);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		}
	}

	@GetMapping("/findByCondition")
	public ResponseEntity<List<ClassificacaoGasto>> findByCondition(@RequestParam String condition) {
		List<ClassificacaoGasto> classificacaoGastos = classificacaoGastoMapper.findByCondition(condition);
		return ResponseEntity.ok(classificacaoGastos);
	}

	@GetMapping("/findByConditionVO")
	public ResponseEntity<List<ClassificacaoGasto>> findByConditionVO(@RequestParam String condition) {
		List<ClassificacaoGasto> classificacaoGastos = classificacaoGastoMapper.findByConditionVO(condition);
		return ResponseEntity.ok(classificacaoGastos);
	}

}