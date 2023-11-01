package com.zhonghui.web.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName ProductAndConsumptionVO
 * @Description
 * @Author Wang Zhisheng
 * @Date 9:55 2023-11-01
 * @Version 17.0.8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductAndConsumptionVO {
    private String modeName;
    private String productName;
    private String productModel;
    private String productSku;
    private String productUnit;
    private String remark;
    private Long dvId;
    private Long productedNum;


    private Float powerConsumption;

    private Float waterConsumption;

    private Float carbonEmissions;

    private Float officePowerConsumption;

    private Float officeWaterConsumption;

    private Float producePowerConsumption;

    private Float produceWaterConsumption;

    private Float total;

}
