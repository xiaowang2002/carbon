package com.zhonghui;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author zhonghui
 */
@Slf4j
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })

public class CarbonApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(CarbonApplication.class, args);
        log.info("项目启动成功");
    }
}
