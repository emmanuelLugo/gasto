package com.py.api.controller.sistema;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.py.api.model.sistema.Licencia;
import com.py.api.service.sistema.LicenciaService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping({ "/api/licencia" })
@AllArgsConstructor
public class LicenciaController {

	LicenciaService licenciaService;

	@GetMapping("/findLicenciaValida")
	public ResponseEntity<?> findLicenciaValida() {
		try {
			Licencia lic = licenciaService.licenciaValida();
			return ResponseEntity.ok(lic);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Licencia Invalida");
		}
	}

	@PostMapping("/atualizaLicencia")
	public ResponseEntity<?> atualizaLicencia(@RequestParam String serie) {
		Licencia lic = licenciaService.atualizaLicencia(serie);
		return ResponseEntity.ok(lic);
	}

}
