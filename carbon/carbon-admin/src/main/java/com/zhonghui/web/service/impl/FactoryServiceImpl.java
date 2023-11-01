package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.FactoryDeviceMapper;
import com.zhonghui.web.mapper.FactoryMapper;
import com.zhonghui.web.mapper.MaterialMapper;
import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.pojo.FactoryDevice;
import com.zhonghui.web.pojo.Material;
import com.zhonghui.web.request.FactoryAndDeviceAndMaterialRequest;
import com.zhonghui.web.service.FactoryService;
import com.zhonghui.web.vo.FactoryAndDeviceVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @ClassName FactoryServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 8:50 2023-10-27
 * @Version 17.0.8
 */
@Service
@Slf4j
public class FactoryServiceImpl implements FactoryService {

    @Resource
    private FactoryMapper factoryMapper;

    @Resource
    private FactoryDeviceMapper factoryDeviceMapper;

    @Override
    public List<Factory> list(Factory factory) {
        return factoryMapper.list(factory);
    }

    @Override
    public FactoryAndDeviceVO getFactoryById(Long id) {
        Factory factory = factoryMapper.getFactoryById(id);
        List<FactoryDevice> factoryDevices = factoryMapper.getFactoryDevicesById(id);
        FactoryAndDeviceVO factoryAndDeviceVO = new FactoryAndDeviceVO();
        BeanUtils.copyProperties(factory, factoryAndDeviceVO);
        factoryAndDeviceVO.setFactoryDeviceList(factoryDevices);
        return factoryAndDeviceVO;
    }

    @Transactional
    @Override
    public Boolean edit(FactoryAndDeviceAndMaterialRequest request) {
        int i = factoryMapper.edit(request);
        List<FactoryDevice> factoryDeviceList = request.getFactoryDeviceList();
        factoryDeviceMapper.delete(request.getId());
        Long factoryId = request.getId();
        for (FactoryDevice factoryDevice : factoryDeviceList) {
            factoryDevice.setFactoryId(factoryId);
        }

        if (!factoryDeviceList.isEmpty()) {
            factoryDeviceMapper.add(factoryDeviceList);
        }
        return i > 0;
    }

    @Override
    public Boolean delete(Long id) {
        factoryDeviceMapper.delete(id);
        return factoryMapper.delete(id) > 0;
    }

    @Transactional
    @Override
    public Boolean add(FactoryAndDeviceAndMaterialRequest request) {
        Factory factory = new Factory();
        BeanUtils.copyProperties(request, factory);
        factoryMapper.add(factory);

        log.info("factory:{}", factory.toString());

        List<FactoryDevice> factoryDeviceList = request.getFactoryDeviceList();

        factoryDeviceList = factoryDeviceList.stream().map(item -> {
            item.setFactoryId(factory.getId());
            return item;
        }).collect(Collectors.toList());

        if (!factoryDeviceList.isEmpty()) {
            factoryDeviceMapper.add(factoryDeviceList);
        }

        return true;
    }
}
