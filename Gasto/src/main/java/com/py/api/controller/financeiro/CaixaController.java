package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

	@PostMapping("/atualizaStatusCaixa/{id}")
	public ResponseEntity<?> atualizaStatusCaixa(@PathVariable Long id) {
		Caixa caixa = caixaService.atualizaStatusCaixa(id);
		return ResponseEntity.ok(caixa);
	}

	@GetMapping("/findByCondition")
	public ResponseEntity<List<Caixa>> findByCondition(@RequestParam String condition) {
		List<Caixa> caixas = caixaService.findByCondition(condition);
		return ResponseEntity.ok(caixas);
	}

	@GetMapping("/findByConditionOrderByAbertos")
	public ResponseEntity<List<Caixa>> findByConditionOrderByAbertos(@RequestParam String condition) {
		List<Caixa> caixas = caixaService.findByConditionOrderByAbertos(condition);
		return ResponseEntity.ok(caixas);
	}

	@GetMapping("/findCaixasAbertas")
	public ResponseEntity<List<Caixa>> findCaixasAbertas() {
		List<Caixa> caixas = caixaService.findCaixasAbertas();
		return ResponseEntity.ok(caixas);
	}

}