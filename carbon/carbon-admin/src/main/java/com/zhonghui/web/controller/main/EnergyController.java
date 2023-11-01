package com.zhonghui.web.controller.main;

import com.zhonghui.response.BaseResult;
import com.zhonghui.web.pojo.EnergyConsumption;
import com.zhonghui.web.service.EnergyService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @ClassName EnergyController
 * @Description
 * @Author Wang Zhisheng
 * @Date 10:47 2023-11-01
 * @Version 17.0.8
 */
@RestController
@RequestMapping("energyConsumption")
public class EnergyController {

    @Resource
    private EnergyService energyService;


    @PostMapping("add")
    public BaseResult<Void> add(@RequestBody EnergyConsumption energyConsumption) {
        energyService.add(energyConsumption);
        return BaseResult.success();
    }
}
