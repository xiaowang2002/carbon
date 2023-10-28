package com.zhonghui.web.service;

import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.request.FactoryAndDeviceAndMaterialRequest;
import com.zhonghui.web.vo.FactoryAndDeviceVO;

import java.util.List;

/**
 * @ClassName FactoryService
 * @Description
 * @Author WangZhisheng
 * @Date 8:50 2023-10-27
 * @Version 11.0.15
 */
public interface FactoryService {
    /**
     * 列表查询
     *
     * @param factory 参数
     * @return 查询结果
     */
    List<Factory> list(Factory factory);

    /**
     * 根据id查询工厂建模
     *
     * @param id 编号
     * @return 查询结果
     */
    FactoryAndDeviceVO getFactoryById(Long id);

    /**
     * 修改工厂建模
     *
     * @param request 工厂建模参数
     * @return 更新结果
     */
    Boolean edit(FactoryAndDeviceAndMaterialRequest request);

    /**
     * 删除工厂
     *
     * @param id 列表
     * @return 删除结果
     */
    Boolean delete(Long id);

    /**
     * 添加工厂建模
     *
     * @param request 工厂建模数据
     * @return 添加结果
     */
    Boolean add(FactoryAndDeviceAndMaterialRequest request);
}
