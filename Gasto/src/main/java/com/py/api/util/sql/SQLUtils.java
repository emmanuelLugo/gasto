package com.py.api.util.sql;

public class SQLUtils {
	
	public static String  like(String value) {
		if(value == null || value.isEmpty()) {
			return "'%%'";
		}
		return "'%"+value.toUpperCase()+"%'";
	}

}
