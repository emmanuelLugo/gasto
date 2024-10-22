package com.py.api.controller.financeiro;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.mapper.financeiro.ContaReceberMapper;
import com.py.api.model.entity.ContaReceber;
import com.py.api.service.financeiro.ContaReceberService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/contaReceber" })
@AllArgsConstructor
public class ContaReceberController {

	private ContaReceberService contaReceberService;

	private ContaReceberMapper contaReceberMapper;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody ContaReceber contaReceber) { 
			ContaReceber conta = contaReceberService.saveRecebimentoContaReceber(contaReceber);
			return ResponseEntity.ok(conta);
	}

	@RequestMapping(value = "/findByCondition", method = RequestMethod.GET)
	public ResponseEntity<List<ContaReceber>> findByCondition(@RequestParam String condition) {
		List<ContaReceber> contaRecebers = contaReceberMapper.findByCondition(condition);
		return ResponseEntity.ok(contaRecebers);
	}
	
	@RequestMapping(value = "/findById", method = RequestMethod.GET)
	public ResponseEntity<ContaReceber> findByCondition(@RequestParam Long idContaReceber) {
		ContaReceber contaReceber = contaReceberMapper.findById(idContaReceber);
		return ResponseEntity.ok(contaReceber);
	}
}