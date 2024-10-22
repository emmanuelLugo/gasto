package com.py.api.repository.financeiro;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.py.api.model.entity.EntradaCaixa;

@Repository
public interface EntradaCaixaRepository extends JpaRepository<EntradaCaixa, Long> {


}