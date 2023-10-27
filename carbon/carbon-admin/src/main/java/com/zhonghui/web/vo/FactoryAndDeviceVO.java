package com.zhonghui.web.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.pojo.FactoryDevice;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @ClassName FactoryAndDeviceVO
 * @Description
 * @Author Wang Zhisheng
 * @Date 15:37 2023-10-27
 * @Version 17.0.8
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FactoryAndDeviceVO extends Factory {
    private String deviceName;
    private String deviceCode;
    private String deviceModel;
    private String produceDate;
    private String produceCode;
    private String manufacturer;
    private Long factoryId;
}
