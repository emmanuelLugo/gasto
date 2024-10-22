package com.py.api.controller.sistema;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.model.entity.Parametros;
import com.py.api.service.sistema.ParametrosService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/parametros" })
@AllArgsConstructor
public class ParametrosController {

	private ParametrosService parametrosService;

	@PostMapping("/save")
	public ResponseEntity<?> save(@RequestBody Parametros parametros) {
		parametros = parametrosService.save(parametros);
		return ResponseEntity.ok(parametros);
	}

	@GetMapping(value = "/findParametro")
	public ResponseEntity<?> findParametro(@RequestParam String chave) {
		Parametros parametro = parametrosService.findParametros(chave);
		return ResponseEntity.ok(parametro);
	}

}