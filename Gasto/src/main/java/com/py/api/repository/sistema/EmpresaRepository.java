package com.py.api.repository.sistema;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.sistema.Empresa;

@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Long> {

}