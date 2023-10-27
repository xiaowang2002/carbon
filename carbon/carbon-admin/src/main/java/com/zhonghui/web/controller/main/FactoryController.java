package com.zhonghui.web.controller.main;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.zhonghui.response.BaseResult;
import com.zhonghui.web.pojo.Factory;
import com.zhonghui.web.service.FactoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName FactoryController
 * @Description
 * @Author Wang Zhisheng
 * @Date 8:47 2023-10-27
 * @Version 17.0.8
 */
@Api(tags = "工厂建模")
@RestController
@RequestMapping("/mes/factory")
public class FactoryController {

    @Resource
    private FactoryService factoryService;


    @ApiOperation("工厂建模数据列表")
    @GetMapping("/list")
    public BaseResult<List<Factory>> list(Factory factory) {
        List<Factory> list = factoryService.list(factory);
        return BaseResult.success(list);
    }

    @GetMapping("/{id}")
    public BaseResult<Factory> getFactoryById(@PathVariable Long id) {
        Factory factory = factoryService.getFactoryById(id);
        return BaseResult.success(factory);
    }

    @PutMapping
    public BaseResult<String> edit(@RequestBody Factory factory) {
        Boolean isSuccess = factoryService.edit(factory);
        if (isSuccess) {
            return BaseResult.success("更改成功");
        } else {
            return BaseResult.error("更改失败");
        }
    }

    @DeleteMapping("/{id}")
    public BaseResult<String> delete(@PathVariable Long id) {
        Boolean isSuccess = factoryService.delete(id);
        if (isSuccess) {
            return BaseResult.success("删除成功");
        } else {
            return BaseResult.error("删除失败");
        }
    }

    @PostMapping
    public BaseResult<String> add(@RequestBody Factory factory) {
        Boolean isSuccess = factoryService.add(factory);
        if (isSuccess) {
            return BaseResult.success("添加成功");
        } else {
            return BaseResult.error("添加失败");
        }
    }
}
