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

import com.py.api.mapper.financeiro.RecebimentoMapper;
import com.py.api.model.entity.Recebimento;
import com.py.api.service.financeiro.RecebimentoService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/recebimento" })
@AllArgsConstructor
public class RecebimentoController {

	private RecebimentoService recebimentoService;

	private RecebimentoMapper recebimentoMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody Recebimento recebimento) { 
		try {
			recebimento = recebimentoService.save(recebimento);
			return ResponseEntity.ok(recebimento);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		}
	}

	@RequestMapping(value = "/findByCondition", method = RequestMethod.GET)
	public ResponseEntity<List<Recebimento>> findByCondition(@RequestParam String condition) {
		List<Recebimento> recebimentos = recebimentoMapper.findByCondition(condition);
		return ResponseEntity.ok(recebimentos);
	}
}