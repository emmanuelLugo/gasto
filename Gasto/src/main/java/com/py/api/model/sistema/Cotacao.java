package com.py.api.model.sistema;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "BS_COTACAO")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cotacao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_COTACAO")
	private Long id;

	@Column(name = "DT_COTACAO")
	private LocalDateTime dtCotacao;

	@Column(name = "USUARIO")
	private String usuario;

	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "ID_COTACAO", referencedColumnName = "ID_COTACAO")
	private List<ItemCotacao> itens = new ArrayList<>();

	public ItemCotacao filterByMoeda(Long id) {
		for (ItemCotacao itemCotacao : itens) {
			if (itemCotacao.getMoeda().getId() == id) {
				return itemCotacao;
			}
		}
		return null;
	}

}
