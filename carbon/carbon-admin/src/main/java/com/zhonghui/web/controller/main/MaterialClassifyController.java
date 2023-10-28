package com.zhonghui.web.controller.main;

import com.zhonghui.web.pojo.Material;
import com.zhonghui.web.pojo.MaterialClassify;
import com.zhonghui.web.service.MaterialClassifyService;
import com.zhonghui.web.service.MaterialService;
import com.zhonghui.web.vo.MaterialClassifyVO;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @ClassName MaterialClassifyController
 * @Description
 * @Author Wang Zhisheng
 * @Date 16:25 2023-10-27
 * @Version 17.0.8
 */
@RestController
@RequestMapping("/materialClassify")
public class MaterialClassifyController {
    @Resource
    private MaterialClassifyService materialClassifyService;

    @GetMapping("/tree")
    public List<MaterialClassifyVO> buildTree() {
        List<MaterialClassify> list = materialClassifyService.list();
        Map<Long, List<MaterialClassify>> perListMap =
                list.stream().collect(Collectors.groupingBy(MaterialClassify::getPid));
        List<MaterialClassifyVO> voList = list.stream().map(item -> {
            MaterialClassifyVO vo = new MaterialClassifyVO();
            BeanUtils.copyProperties(item, vo);
            vo.setChildren(perListMap.get(item.getId()));
            return vo;
        }).collect(Collectors.toList());
        return voList.stream()
                .filter(vo -> vo.getChildren() != null && !vo.getChildren().isEmpty())
                .collect(Collectors.toList());
    }

}
