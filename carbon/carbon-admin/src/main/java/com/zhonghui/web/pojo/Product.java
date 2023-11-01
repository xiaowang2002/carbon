package com.zhonghui.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Product
 * @Description
 * @Author Wang Zhisheng
 * @Date 12:48 2023-10-27
 * @Version 17.0.8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private Long id;
    private String modeName;
    private String productName;
    private String productModel;
    private String productSku;
    private String productUnit;
    private String remark;
    private Long dvId;
    private Long productedNum;
}
