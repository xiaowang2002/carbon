package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.FactoryDevice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName FactoryDeviceMapper
 * @Description
 * @Author WangZhisheng
 * @Date 0:48 2023-10-28
 * @Version 11.0.15
 */
@Mapper
public interface FactoryDeviceMapper {
    void delete(Long id);

    void add(List<FactoryDevice> factoryDeviceList);

    void deleteById(Long id);

}

