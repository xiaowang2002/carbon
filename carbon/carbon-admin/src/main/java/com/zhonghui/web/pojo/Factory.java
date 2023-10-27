package com.zhonghui.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Factory
 * @Description
 * @Author Wang Zhisheng
 * @Date 8:53 2023-10-27
 * @Version 17.0.8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Factory {
    private Long id;
    private String product;
    private String productionLine;
    private String productMode;
    private String specifications;
    private String factoryDescribe;
}
