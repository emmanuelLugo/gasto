package com.py.api.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

@AllArgsConstructor
@Data
@EqualsAndHashCode(callSuper = false)
public class CaixaException extends Exception {

	private static final long serialVersionUID = 6203326996691499354L;
	private String message;

}
