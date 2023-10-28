package com.zhonghui.web.controller.main;

import com.zhonghui.response.BaseResult;
import com.zhonghui.web.service.FactoryDeviceService;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @ClassName FactoryDeviceController
 * @Description
 * @Author Wang Zhisheng
 * @Date 10:17 2023-10-28
 * @Version 17.0.8
 */
@RestController
@RequestMapping("/mes/factoryDevice")
public class FactoryDeviceController {

    @Resource
    private FactoryDeviceService factoryDeviceService;

    @DeleteMapping("/{id}")
    public BaseResult<Void> deleteById(@PathVariable Long id) {
        factoryDeviceService.deleteById(id);
        return BaseResult.success();
    }
}
