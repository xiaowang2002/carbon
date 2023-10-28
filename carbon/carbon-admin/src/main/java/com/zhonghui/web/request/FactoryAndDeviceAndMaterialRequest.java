package com.zhonghui.web.request;

import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.pojo.FactoryDevice;
import com.zhonghui.web.pojo.Material;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName FactoryAndDeviceAndMaterialRequest
 * @Description
 * @Author Wang Zhisheng
 * @Date 17:48 2023-10-28
 * @Version 17.0.8
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FactoryAndDeviceAndMaterialRequest extends Factory {

    private String productMode;

    private String specifications;

    private List<FactoryDevice> factoryDeviceList;

}
