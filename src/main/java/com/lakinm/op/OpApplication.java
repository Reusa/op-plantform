package com.lakinm.op;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class OpApplication {

    public static void main(String[] args) {
        SpringApplication.run(OpApplication.class, args);
    }

}
