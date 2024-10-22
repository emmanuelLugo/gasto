package com.py.api.repository.financeiro;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.entity.Gasto;

@Repository
public interface GastoRepository extends JpaRepository<Gasto, Long> {


}