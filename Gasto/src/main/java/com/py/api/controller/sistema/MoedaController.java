package com.py.api.controller.sistema;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.model.sistema.Moeda;
import com.py.api.service.sistema.MoedaService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/moeda" })
@AllArgsConstructor
public class MoedaController {

	private MoedaService moedaService;

	@PostMapping("/save")
	public ResponseEntity<Moeda> save(@RequestBody Moeda moeda) {
		moeda = moedaService.save(moeda);
		return ResponseEntity.ok(moeda);
	}

	@GetMapping("/findByCondition")
	public ResponseEntity<List<Moeda>> findByCondition(@RequestParam("descricao") String descricao) {
		List<Moeda> moedas = moedaService.findByCondition(like(descricao));

		return ResponseEntity.ok(moedas);
	}

	@GetMapping("/findAll")
	public ResponseEntity<List<Moeda>> findAll() {
		List<Moeda> moedas = moedaService.findAll();

		return ResponseEntity.ok(moedas);
	}

	public static String like(String value) {
		if (value == null || value.isEmpty()) {
			return "'%%'";
		}
		return "'%" + value.toUpperCase() + "%'";
	}

}