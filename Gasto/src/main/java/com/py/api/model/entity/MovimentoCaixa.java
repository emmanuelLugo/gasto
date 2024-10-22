package com.py.api.model.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.py.api.model.sistema.Moeda;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "FIN_MOVIMENTO_CAIXA")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MovimentoCaixa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_MOVIMENTO")
	private Long id;

	@Column(name = "DT_MOVIMENTO")
	private Date dtMovimento;

	@Column(name = "VL_MOVIMENTO")
	private BigDecimal vlMovimento;

	@Column(name = "TP_MOVIMENTO")
	private String tipo;

	@ManyToOne
	@JoinColumn(name = "ID_MOEDA", referencedColumnName = "ID_MOEDA")
	private Moeda moeda;

	@ManyToOne
	@JoinColumn(name = "ID_GASTO", referencedColumnName = "ID_GASTO")
	private Gasto gasto;

	@ManyToOne
	@JoinColumn(name = "ID_ENTRADA_CAIXA", referencedColumnName = "ID_ENTRADA_CAIXA")
	private EntradaCaixa entradaCaixa;

	@ManyToOne
	@JoinColumn(name = "ID_CAIXA", referencedColumnName = "ID_CAIXA")
	private Caixa caixa;

	@ManyToOne
	@JoinColumn(name = "ID_VENDA", referencedColumnName = "ID_VENDA")
	private Venda venda;

	@ManyToOne
	@JoinColumn(name = "ID_RECEBIMENTO", referencedColumnName = "ID_RECEBIMENTO")
	private Recebimento recebimento;

	public static MovimentoCaixa byGasto(Gasto gasto, Caixa caixa) {
		MovimentoCaixa movimentoCaixa = new MovimentoCaixa();
		movimentoCaixa.setCaixa(caixa);
		movimentoCaixa.setDtMovimento(new Date());
		movimentoCaixa.setGasto(gasto);
//		movimentoCaixa.setMoeda(gasto.getMoeda());
		movimentoCaixa.setVlMovimento(gasto.getVlGasto());
		movimentoCaixa.setTipo("S");

		return movimentoCaixa;
	}

	public static MovimentoCaixa byRecebimentoVenda(Venda venda, Caixa caixa, Recebimento recebimento) {
		MovimentoCaixa movimentoCaixa = new MovimentoCaixa();
		movimentoCaixa.setCaixa(caixa);
		movimentoCaixa.setDtMovimento(new Date());
		movimentoCaixa.setVenda(venda);
		movimentoCaixa.setMoeda(recebimento.getMoeda());
		movimentoCaixa.setVlMovimento(recebimento.getVlRecebimento());
		movimentoCaixa.setRecebimento(recebimento);
		if (recebimento.getIsTroco()) {
			movimentoCaixa.setTipo("S");
		} else {
			movimentoCaixa.setTipo("E");
		}

		return movimentoCaixa;
	}

	public static MovimentoCaixa byEntrada(EntradaCaixa entradaCaixa, Caixa caixa) {
		MovimentoCaixa movimentoCaixa = new MovimentoCaixa();
		movimentoCaixa.setCaixa(caixa);
		movimentoCaixa.setDtMovimento(new Date());
		movimentoCaixa.setEntradaCaixa(entradaCaixa);
		movimentoCaixa.setMoeda(entradaCaixa.getMoeda());
		movimentoCaixa.setVlMovimento(entradaCaixa.getVlEntrada());
		movimentoCaixa.setTipo("E");

		return movimentoCaixa;
	}

	public static MovimentoCaixa byRecebimento(Recebimento recebimento, Caixa caixa) {
		MovimentoCaixa movimentoCaixa = new MovimentoCaixa();
		movimentoCaixa.setCaixa(caixa);
		movimentoCaixa.setDtMovimento(new Date());
		movimentoCaixa.setRecebimento(recebimento);
		movimentoCaixa.setMoeda(recebimento.getMoeda());
		movimentoCaixa.setVlMovimento(recebimento.getVlRecebimento());
		movimentoCaixa.setTipo("E");

		return movimentoCaixa;
	}

}