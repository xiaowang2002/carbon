package com.zhonghui.web.request;

import lombok.Data;

/**
 * @ClassName TechnologyAndProductRequest
 * @Description
 * @Author Wang Zhisheng
 * @Date 13:57 2023-10-27
 * @Version 17.0.8
 */
@Data
public class TechnologyAndProductRequest {
    private Long id;
    private Long productId;
    private String productName;
    private String technologyName;
    private String unitPowerConsumption;
    private String remark;
    private String technologyDescribe;
}
