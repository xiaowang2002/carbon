package com.zhonghui.web.service.impl;

import com.zhonghui.dv.domain.DvEnergyConsumption;
import com.zhonghui.dv.mapper.DvEnergyConsumptionMapper;
import com.zhonghui.web.mapper.FactoryDeviceMapper;
import com.zhonghui.web.mapper.FactoryMapper;
import com.zhonghui.web.pojo.FactoryDevice;
import com.zhonghui.web.service.FactoryDeviceService;
import com.zhonghui.web.vo.DeviceAndConsumptionVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName FactoryDeviceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 0:51 2023-10-28
 * @Version 17.0.8
 */
@Service
public class FactoryDeviceServiceImpl implements FactoryDeviceService {

    @Resource
    private FactoryDeviceMapper factoryDeviceMapper;


//    @Override
//    public void add(FactoryDevice factoryDevice) {
//        factoryDeviceMapper.add(factoryDevice);
//    }

    @Override
    public void deleteById(Long id) {
        factoryDeviceMapper.deleteById(id);
    }

    @Override
    public List<DeviceAndConsumptionVO> list() {
        return factoryDeviceMapper.list();
    }
}
