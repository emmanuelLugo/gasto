package com.py.api.exception;

public class AppException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1723725834116389731L;

	public AppException(String message) {
		super(message);
	}
}