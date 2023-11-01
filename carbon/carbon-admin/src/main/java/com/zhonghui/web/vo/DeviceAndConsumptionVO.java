package com.zhonghui.web.vo;

import com.zhonghui.common.annotation.Excel;
import com.zhonghui.web.pojo.FactoryDevice;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @ClassName DeviceAndConsumption
 * @Description
 * @Author Wang Zhisheng
 * @Date 8:32 2023-11-01
 * @Version 17.0.8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeviceAndConsumptionVO {

    private String deviceName;
    private String deviceCode;
    private String deviceModel;
    private Date produceDate;
    private String produceCode;
    private String manufacturer;
    private Long factoryId;
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
