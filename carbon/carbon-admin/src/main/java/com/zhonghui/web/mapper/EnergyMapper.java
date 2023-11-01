package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.EnergyConsumption;
import org.apache.ibatis.annotations.Mapper;

/**
 * @ClassName EnergyMapper
 * @Description
 * @Author WangZhisheng
 * @Date 10:55 2023-11-01
 * @Version 11.0.15
 */
@Mapper
public interface EnergyMapper {
    void add(EnergyConsumption energyConsumption);
}
