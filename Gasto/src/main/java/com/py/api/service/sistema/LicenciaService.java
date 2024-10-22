package com.py.api.service.sistema;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.py.api.exception.AppException;
import com.py.api.model.sistema.Licencia;
import com.py.api.repository.sistema.LicenciaRepository;
import com.py.api.util.HostnameUtil;
import com.py.api.util.LicenciaUtil;

import lombok.AllArgsConstructor;

@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class LicenciaService {

	private LicenciaRepository licenciaRepository;

	public Licencia licenciaValida() throws Exception {
		if (HostnameUtil.checkHostname()) {
			Licencia licenciaProgramacao = new Licencia();
			licenciaProgramacao.setAtivo(true);
			licenciaProgramacao.setProgramacao(true);
			licenciaProgramacao.setSerie("");
			return licenciaProgramacao;
		}

		Licencia licencia = licenciaRepository.findFirstByAtivoTrue();
		if (licencia != null) {
			licencia.setFechaUltimoLogin(new Date());
			licencia.setProgramacao(false);
			licenciaRepository.save(licencia);
		}

		return LicenciaUtil.licenciaValida(licencia);
	}

	public Licencia atualizaLicencia(String serie) throws AppException {

		Licencia licencia = new Licencia();
		licencia.setSerie(serie);
		licencia.setAtivo(true);
		licencia = LicenciaUtil.licenciaValida(licencia);
		if (licencia == null) {
			throw new AppException("Licencia Inválida o Vencida");
		}

		if (licencia.getDtExpiracao().before(new Date())) {
			throw new AppException("Licencia Vencida");
		}

		licenciaRepository.deleteAll();
		licenciaRepository.save(licencia);

		return licencia;
	}

}
