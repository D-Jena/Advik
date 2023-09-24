package com.advik.divine;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@ComponentScan(basePackages = {"com.advik.divine.*"})
@EnableJpaRepositories(basePackages = {"com.advik.divine.repository"})
@EntityScan(basePackages = {"com.advik.divine.entity"})
@EnableScheduling
@EnableAsync
@SpringBootApplication
public class AdvikDivineApplication {

	public static void main(String[] args) {
		SpringApplication.run(AdvikDivineApplication.class, args);
	}

}
