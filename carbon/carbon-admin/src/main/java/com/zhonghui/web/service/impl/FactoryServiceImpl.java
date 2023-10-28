package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.FactoryDeviceMapper;
import com.zhonghui.web.mapper.FactoryMapper;
import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.pojo.FactoryDevice;
import com.zhonghui.web.service.FactoryService;
import com.zhonghui.web.vo.FactoryAndDeviceVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName FactoryServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 8:50 2023-10-27
 * @Version 17.0.8
 */
@Service
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

    @Override
    public Boolean edit(FactoryAndDeviceVO factoryAndDeviceVO) {
        int i = factoryMapper.edit(factoryAndDeviceVO);
        List<FactoryDevice> factoryDeviceList = factoryAndDeviceVO.getFactoryDeviceList();
        factoryDeviceMapper.delete(factoryAndDeviceVO.getId());
        Long factoryId = factoryAndDeviceVO.getId();
        for (FactoryDevice factoryDevice : factoryDeviceList) {
            factoryDevice.setFactoryId(factoryId);
        }
        factoryDeviceMapper.add(factoryDeviceList);
        return i > 0;
    }

    @Override
    public Boolean delete(Long id) {
        factoryDeviceMapper.delete(id);
        return factoryMapper.delete(id) > 0;
    }

    @Override
    public Boolean add(Factory factory) {
        return factoryMapper.add(factory) > 0;
    }
}
