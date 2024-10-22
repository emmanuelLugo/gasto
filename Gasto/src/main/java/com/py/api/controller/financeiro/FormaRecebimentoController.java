package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.financeiro.FormaRecebimentoMapper;
import com.py.api.model.entity.FormaRecebimento;
import com.py.api.service.financeiro.FormaRecebimentoService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/formaRecebimento" })
@AllArgsConstructor
public class FormaRecebimentoController {

	private FormaRecebimentoService formaRecebimentoService;

	private FormaRecebimentoMapper formaRecebimentoMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody FormaRecebimento formaRecebimento) {
		formaRecebimento = formaRecebimentoService.save(formaRecebimento);
		return ResponseEntity.ok(formaRecebimento);
	}

	@RequestMapping(value = "/findByCondition", method = RequestMethod.GET)
	public ResponseEntity<List<FormaRecebimento>> findByCondition(@RequestParam String condition) {
		List<FormaRecebimento> formaRecebimentos = formaRecebimentoMapper.findByCondition(condition);
		return ResponseEntity.ok(formaRecebimentos);
	}
}