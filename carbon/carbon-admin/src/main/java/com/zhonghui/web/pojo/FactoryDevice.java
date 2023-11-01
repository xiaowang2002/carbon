package com.zhonghui.web.pojo;

import lombok.Data;

import java.util.Date;

/**
 * @ClassName FactoryDevice
 * @Description
 * @Author Wang Zhisheng
 * @Date 15:32 2023-10-27
 * @Version 17.0.8
 */
@Data
public class FactoryDevice {
    private Long id;
    private String deviceName;
    private String deviceCode;
    private String deviceModel;
    private Date produceDate;
    private String produceCode;
    private String manufacturer;
    private Long factoryId;
    private Long dvId;
    private Long productedNum;
}
