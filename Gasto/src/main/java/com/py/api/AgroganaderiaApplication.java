package com.py.api;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@MapperScan("com.py.api.mapper")
@EnableJpaAuditing
public class AgroganaderiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(AgroganaderiaApplication.class, args);
	}

}
