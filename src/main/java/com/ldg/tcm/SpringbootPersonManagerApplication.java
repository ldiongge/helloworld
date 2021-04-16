package com.ldg.tcm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ldg.tcm.mapper")
public class SpringbootPersonManagerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootPersonManagerApplication.class, args);
    }

}
