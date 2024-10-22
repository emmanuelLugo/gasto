package com.py.api.repository.sistema;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.entity.Parametros;

@Repository
public interface ParametrosRepository extends JpaRepository<Parametros, Long> {


}