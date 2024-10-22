package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.financeiro.EntradaCaixaMapper;
import com.py.api.model.entity.EntradaCaixa;
import com.py.api.service.financeiro.EntradaCaixaService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/entradaCaixa" })
@AllArgsConstructor
public class EntradaCaixaController {

	private EntradaCaixaService entradaCaixaService;
	private EntradaCaixaMapper entradaCaixaMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody EntradaCaixa entradaCaixa, @RequestHeader("usuario") String usuario) {
		try {
			entradaCaixa = entradaCaixaService.save(entradaCaixa, usuario);
			return ResponseEntity.ok(entradaCaixa);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
		}
	}

	@RequestMapping(value = "/findByCondition", method = RequestMethod.GET)
	public ResponseEntity<List<EntradaCaixa>> findByCondition(@RequestParam String condition) {
		List<EntradaCaixa> entradaCaixas = entradaCaixaMapper.findByCondition(condition);
		return ResponseEntity.ok(entradaCaixas);
	}

	@PostMapping("/cancelaEntrada/{id}")
	public ResponseEntity<?> cancelaEntrada(@PathVariable Long id, @RequestHeader("usuario") String usuario) {
		try {
			EntradaCaixa entradaCaixa = entradaCaixaService.cancelaEntradaById(id, usuario);
			return ResponseEntity.ok(entradaCaixa);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
		}
	}

}