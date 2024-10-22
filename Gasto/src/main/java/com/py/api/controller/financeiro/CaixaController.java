package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.py.api.model.entity.Caixa;
import com.py.api.service.financeiro.CaixaService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/caixa" })
@AllArgsConstructor
public class CaixaController {

	private CaixaService caixaService;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody Caixa caixa) {
		caixa = caixaService.save(caixa);
		return ResponseEntity.ok(caixa);
	}

	@GetMapping("/findByCondition")
	public ResponseEntity<List<Caixa>> findByCondition(@RequestParam String condition) {
		List<Caixa> caixas = caixaService.findByCondition(condition);
		return ResponseEntity.ok(caixas);
	}

}