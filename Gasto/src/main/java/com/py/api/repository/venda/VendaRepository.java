package com.py.api.repository.venda;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.entity.Venda;

@Repository
public interface VendaRepository extends JpaRepository<Venda, Long> {


}
