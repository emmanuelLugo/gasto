package com.py.api.controller.registro;

import java.util.List;

import javax.validation.Valid;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.registro.PessoaMapper;
import com.py.api.model.dto.GenericResponseEntity;
import com.py.api.model.entity.Pessoa;
import com.py.api.service.registro.PessoaService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/pessoa" })
@AllArgsConstructor
public class PessoaController {

	private PessoaService pessoaService;

	private PessoaMapper pessoaController;

	@PostMapping("/save")
	public ResponseEntity<?> save(@Valid @RequestBody Pessoa pessoa) {
		try {
			pessoa = pessoaService.save(pessoa);
			return ResponseEntity.ok(pessoa);
		} catch (DataAccessException ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getCause().getCause().getMessage());
		}
	}

	@RequestMapping("/findByCondition")
	public ResponseEntity<List<Pessoa>> findByCondition(@RequestParam String condition) {
		List<Pessoa> pessoas = pessoaController.findByCondition(condition);
		return ResponseEntity.ok(pessoas);
	}

	@RequestMapping(value = "/findByConditionPage", method = RequestMethod.GET)
	public GenericResponseEntity<?> findByConditionPage(@RequestParam String condition, @RequestParam int pageNr,
			@RequestParam int pageSize) {
		return pessoaService.findByConditionPage(condition, pageNr, pageSize);
	}
}