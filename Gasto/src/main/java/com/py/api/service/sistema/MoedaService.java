package com.py.api.service.sistema;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.model.sistema.Moeda;
import com.py.api.repository.sistema.MoedaRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class MoedaService {

	private MoedaRepository moedaRepository;

	public Moeda save(Moeda moeda) {
		return moedaRepository.save(moeda);
	}

	public List<Moeda> findByCondition(String ds_moeda) {
		return moedaRepository.findByDescricaoContaining(ds_moeda);
	}
	
	public List<Moeda> findAll() {
		return moedaRepository.findAll();
	}

}