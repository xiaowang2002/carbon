package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.EnergyMapper;
import com.zhonghui.web.pojo.EnergyConsumption;
import com.zhonghui.web.service.EnergyService;
import lombok.Data;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @ClassName EnergyServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 10:47 2023-11-01
 * @Version 17.0.8
 */
@Service
public class EnergyServiceImpl implements EnergyService {

    @Resource
    private EnergyMapper energyMapper;

    @Override
    public void add(EnergyConsumption energyConsumption) {
        energyMapper.add(energyConsumption);
    }
}
