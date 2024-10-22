package com.py.api.repository.financeiro;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.entity.Caixa;

@Repository
public interface CaixaRepository extends JpaRepository<Caixa, Long> {

	Caixa findOneById(Long id);

}