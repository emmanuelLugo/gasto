package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.financeiro.MovimentoCaixaMapper;
import com.py.api.model.entity.MovimentoCaixa;
import com.py.api.service.financeiro.MovimentoCaixaService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/movimentoCaixa" })
@AllArgsConstructor
public class MovimentoCaixaController {

	private MovimentoCaixaService movimentoCaixaService;

	private MovimentoCaixaMapper movimentoCaixaMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody MovimentoCaixa movimentoCaixa) { 
		try {
			movimentoCaixa = movimentoCaixaService.save(movimentoCaixa);
			return ResponseEntity.ok(movimentoCaixa);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		}
	}

	@RequestMapping(value = "/findByCondition", method = RequestMethod.GET)
	public ResponseEntity<List<MovimentoCaixa>> findByCondition(@RequestParam String condition) {
		List<MovimentoCaixa> movimentoCaixas = movimentoCaixaMapper.findByCondition(condition);
		return ResponseEntity.ok(movimentoCaixas);
	}
}