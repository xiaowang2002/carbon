package com.zhonghui.web.service;

import com.zhonghui.web.pojo.FactoryDevice;
import com.zhonghui.web.vo.DeviceAndConsumptionVO;

import java.util.List;

/**
 * @ClassName FactoryDeviceService
 * @Description
 * @Author WangZhisheng
 * @Date 0:50 2023-10-28
 * @Version 11.0.15
 */
public interface FactoryDeviceService {

//    void add(FactoryDevice factoryDevice);

    void deleteById(Long id);

    List<DeviceAndConsumptionVO> list();
}
