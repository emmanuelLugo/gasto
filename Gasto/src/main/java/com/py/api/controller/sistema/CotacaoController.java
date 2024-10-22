package com.py.api.controller.sistema;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.model.sistema.Cotacao;
import com.py.api.service.sistema.CotacaoService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/cotacao" })
@AllArgsConstructor
public class CotacaoController {

	private CotacaoService cotacaoService;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody Cotacao cotacao, @RequestHeader("usuario") String usuario) {
		cotacao = cotacaoService.save(cotacao, usuario);
		return ResponseEntity.ok(cotacao);
	}

	@GetMapping(value = "/findByCondition")
	public ResponseEntity<List<Cotacao>> findByCondition(@RequestParam String condition) {
		List<Cotacao> cotacoes = cotacaoService.findByCondition(condition);
		return ResponseEntity.ok(cotacoes);
	}

	@GetMapping(value = "/findCotacaoAtual")
	public ResponseEntity<?> findCotacaoAtual() {
		Cotacao cotacao = cotacaoService.findCotacaoAtual();
		return ResponseEntity.ok(cotacao);
	}
}