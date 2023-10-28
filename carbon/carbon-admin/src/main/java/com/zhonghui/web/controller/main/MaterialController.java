package com.zhonghui.web.controller.main;

import com.zhonghui.response.BaseResult;
import com.zhonghui.web.pojo.Material;
import com.zhonghui.web.service.MaterialService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName MaterialController
 * @Description
 * @Author Wang Zhisheng
 * @Date 16:25 2023-10-27
 * @Version 17.0.8
 */
@RestController
@RequestMapping("/material")
public class MaterialController {

    @Resource
    private MaterialService materialService;

    @GetMapping("/{id}")
    public BaseResult<List<Material>> getMaterialListByClassifyId(@PathVariable Long id) {
        return BaseResult.success(materialService.getMaterialListByClassifyId(id));
    }
}
