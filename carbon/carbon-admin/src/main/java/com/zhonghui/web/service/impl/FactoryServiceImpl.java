package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.FactoryMapper;
import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.service.FactoryService;
import com.zhonghui.web.vo.FactoryAndDeviceVO;
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

    @Override
    public List<Factory> list(Factory factory) {
        return factoryMapper.list(factory);
    }

    @Override
    public FactoryAndDeviceVO getFactoryById(Long id) {
        return factoryMapper.getFactoryById(id);
    }

    @Override
    public Boolean edit(Factory factory) {
        int i = factoryMapper.edit(factory);
        return i > 0;
    }

    @Override
    public Boolean delete(Long id) {
        return factoryMapper.delete(id) > 0;
    }

    @Override
    public Boolean add(Factory factory) {
        return factoryMapper.add(factory) > 0;
    }
}
