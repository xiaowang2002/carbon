package com.zhonghui.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Technology
 * @Description
 * @Author Wang Zhisheng
 * @Date 12:46 2023-10-27
 * @Version 17.0.8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Technology {
    private Long id;
    private String technologyName;
    private String productId;
    private String unitPowerConsumption;
    private String remark;
    private String technologyDescribe;
}
