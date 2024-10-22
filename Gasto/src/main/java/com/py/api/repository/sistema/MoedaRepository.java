package com.py.api.repository.sistema;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.sistema.Moeda;

@Repository
public interface MoedaRepository extends JpaRepository<Moeda, Long> {

	public List<Moeda> findByDescricaoContaining(String descricao);
	public List<Moeda> findAll();
}