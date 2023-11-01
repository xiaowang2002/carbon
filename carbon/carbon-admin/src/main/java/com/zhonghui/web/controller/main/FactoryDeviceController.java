package com.zhonghui.web.controller.main;

import com.zhonghui.response.BaseResult;
import com.zhonghui.web.pojo.FactoryDevice;
import com.zhonghui.web.service.FactoryDeviceService;
import com.zhonghui.web.vo.DeviceAndConsumptionVO;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

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

    @DeleteMapping
    public BaseResult<Boolean> delete() {
        return BaseResult.success();
    }

    @GetMapping
    public BaseResult<List<DeviceAndConsumptionVO>> list() {
        List<DeviceAndConsumptionVO> list = factoryDeviceService.list();
        return BaseResult.success(list);
    }
}
