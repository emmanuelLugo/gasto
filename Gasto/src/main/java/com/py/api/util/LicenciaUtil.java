package com.py.api.util;

import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import com.py.api.exception.AppException;
import com.py.api.model.sistema.Licencia;

public class LicenciaUtil {

	private static final String SECRET_KEY = "clave_secreta_para_cifrado";
	private static final String SALT = "valor_salt_unico";

	public static Licencia licenciaValida(Licencia licencia) throws AppException {

		try {
			byte[] cifrado = Base64.getDecoder().decode(licencia.getSerie());
			String infoLicencia = descifrar(cifrado, SECRET_KEY);
			String[] partes = infoLicencia.split("\\|");
			long timestampExpiracion = Long.parseLong(partes[0]);

			String identificadorPCGuardado = partes[1];
			String identificadorPC = HostnameUtil.getPCIdentifier();

			// Verificar si el identificador de la PC coincide
			if (!identificadorPC.equals(identificadorPCGuardado)) {
				throw new AppException("");
			}

			Date dtExpiracao = new Date(timestampExpiracion);
			// Convertir Date a LocalDate
			Instant instant = dtExpiracao.toInstant();
			LocalDate localDateExpiracion = instant.atZone(ZoneId.systemDefault()).toLocalDate();
			LocalDate fechaActual = LocalDate.now();
			long diasAVencer = ChronoUnit.DAYS.between(fechaActual, localDateExpiracion);

			Licencia licencaNova = new Licencia();
			licencaNova.setId(licencia.getId());
			licencaNova.setDtExpiracao(dtExpiracao);
			licencaNova.setSerie(licencia.getSerie());
			licencaNova.setAtivo(licencia.isAtivo());
			licencaNova.setFechaUltimoLogin(new Date());
			licencaNova.setProgramacao(licencia.getProgramacao());
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/YYYY");
			licencaNova.setDtExpiracaoString(df.format(dtExpiracao));
			licencaNova.setDiasAVencer(diasAVencer);

			return licencaNova;

		} catch (Exception e) {
			return null;
		}
	}

	protected static byte[] cifrar(String texto, String clave) throws Exception {
		SecretKey key = generarClaveSecreta(clave);
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, key);
		return cipher.doFinal(texto.getBytes(StandardCharsets.UTF_8));
	}

	protected static String descifrar(byte[] cifrado, String clave) throws Exception {
		SecretKey key = generarClaveSecreta(clave);
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, key);
		byte[] resultado = cipher.doFinal(cifrado);
		return new String(resultado, StandardCharsets.UTF_8);
	}

	protected static SecretKey generarClaveSecreta(String clave)
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		byte[] salt = SALT.getBytes(StandardCharsets.UTF_8);
		int iterations = 10000;
		int keyLength = 128; // Longitud de clave AES de 128 bits
		KeySpec spec = new PBEKeySpec(clave.toCharArray(), salt, iterations, keyLength);
		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		SecretKey secretKey = factory.generateSecret(spec);
		return new SecretKeySpec(secretKey.getEncoded(), "AES");
	}

}
