package com.py.api.util.conversor;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.springframework.stereotype.Component;

import com.py.api.model.entity.Parametros;
import com.py.api.model.sistema.ItemCotacao;
import com.py.api.service.sistema.CotacaoService;
import com.py.api.service.sistema.ParametrosService;

import lombok.AllArgsConstructor;

@Component(value = "conversormoedaBaseFinanceiro")
@AllArgsConstructor
public class ConversorMoedaFinanceiro {

    private CotacaoService cotacaoService;
    private ParametrosService parametrosService;

    // Función para buscar la moneda base
    private Parametros getMoedaBase(String parametro) {
        return parametrosService.findParametros(parametro);
    }

    // Función para buscar la cotización actual
    private BigDecimal getCotacao(Long idMoeda) {
        ItemCotacao item = cotacaoService.findCotacaoAtual().filterByMoeda(idMoeda);
        return item != null ? item.getVlFinancero() : BigDecimal.ZERO;
    }

    // Conversión genérica que recibe el nombre de las monedas y el valor
    public BigDecimal converter(BigDecimal valor, String moedaOrigem, String moedaDestino) {

        switch (moedaOrigem) {
            case "DOLAR":
                if (moedaDestino.equals("GUARANI")) return valor.multiply(getCotacao(1L));
                if (moedaDestino.equals("REAL")) return valor.divide(getCotacao(2L), 5, RoundingMode.HALF_UP);
                break;
            case "REAL":
                if (moedaDestino.equals("DOLAR")) return valor.multiply(getCotacao(2L));
                if (moedaDestino.equals("GUARANI")) return valor.multiply(getCotacao(1L)).divide(new BigDecimal(1000), 5, RoundingMode.HALF_UP);
                break;
            case "GUARANI":
                if (moedaDestino.equals("DOLAR")) return valor.divide(getCotacao(2L), 5, RoundingMode.HALF_UP);
                if (moedaDestino.equals("REAL")) return valor.divide(getCotacao(3L), 5, RoundingMode.HALF_UP).multiply(new BigDecimal(1000));
                break;
        }
        return BigDecimal.ZERO; // Retornar 0 si no hay conversión válida
    }

    // Funciones específicas pueden delegar en la genérica
    public BigDecimal converteDolarAGuarani(BigDecimal valor) {
        return converter(valor, "DOLAR", "GUARANI");
    }

    public BigDecimal converteDolarAReal(BigDecimal valor) {
        return converter(valor, "DOLAR", "REAL");
    }

    public BigDecimal converteRealADolar(BigDecimal valor) {
        return converter(valor, "REAL", "DOLAR");
    }

    public BigDecimal converteRealAGuarani(BigDecimal valor) {
        return converter(valor, "REAL", "GUARANI");
    }

    public BigDecimal converteGuaraniADolar(BigDecimal valor) {
        return converter(valor, "GUARANI", "DOLAR");
    }

    public BigDecimal converteGuaraniAReal(BigDecimal valor) {
        return converter(valor, "GUARANI", "REAL");
    }
}
