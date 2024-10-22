package com.py.api.repository.sistema;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.py.api.model.sistema.Licencia;

@Repository
public interface LicenciaRepository extends JpaRepository<Licencia, Long> {
	Licencia findFirstByAtivoTrue();

}
