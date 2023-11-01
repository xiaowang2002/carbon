package com.zhonghui.web.pojo;

import com.zhonghui.common.annotation.Excel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName EnergyConsumption
 * @Description
 * @Author Wang Zhisheng
 * @Date 10:53 2023-11-01
 * @Version 17.0.8
 */
@Data
public class EnergyConsumption implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;

    private Float powerConsumption;

    private Float waterConsumption;

    private Float carbonEmissions;

    private Float officePowerConsumption;

    private Float officeWaterConsumption;

    private Float producePowerConsumption;

    private Float produceWaterConsumption;

    private Float total;

}
