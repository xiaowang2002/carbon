package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.pojo.FactoryDevice;
import com.zhonghui.web.vo.FactoryAndDeviceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName FactoryMapper
 * @Description
 * @Author WangZhisheng
 * @Date 8:47 2023-10-27
 * @Version 11.0.15
 */
@Mapper
public interface FactoryMapper {
    List<Factory> list(Factory factory);

    List<FactoryDevice> getFactoryDevicesById(Long id);

    int edit(Factory factory);

    int delete(Long id);

    int add(Factory factory);

    Factory getFactoryById(Long id);
}
