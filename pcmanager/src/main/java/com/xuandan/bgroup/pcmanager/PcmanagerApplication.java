package com.xuandan.bgroup.pcmanager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.xuandan.bgroup.pcmanager.dao")
public class PcmanagerApplication {

    public static void main(String[] args) {
        SpringApplication.run(PcmanagerApplication.class, args);
    }

}
