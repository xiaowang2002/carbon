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

    /**
     * 这段代码的作用是将一个 List<MaterialClassify> 转换为 List<MaterialClassifyVO>。它首先根据 pid 属性对 MaterialClassify 对象进行分组，然后根据这些分组创建 MaterialClassifyVO 对象，并将其嵌套在对应的父对象中。让我们逐步分析这段代码：
     * List<MaterialClassify> list = materialClassifyService.list();：从 materialClassifyService 中获取 MaterialClassify 对象的列表。
     * Map<Long, List<MaterialClassify>> perListMap = list.stream().collect(Collectors.groupingBy(MaterialClassify::getPid));：这行代码根据 pid 属性将 list 分组，并创建一个 Map 对象，键为 pid，值为对应的 MaterialClassify 对象列表。
     * List<MaterialClassifyVO> voList = list.stream().map(item -> { ... }).collect(Collectors.toList());：这部分代码使用流操作对每个 MaterialClassify 对象进行转换。对于每个对象，它创建一个新的 MaterialClassifyVO 对象，并使用 BeanUtils.copyProperties 将属性从原始对象复制到新对象。然后，它通过 perListMap.get(item.getId()) 设置了子对象列表。最后，它将转换后的 MaterialClassifyVO 对象收集到一个新的列表 voList 中并返回。
     * 总的来说，这段代码的目的是将原始的 MaterialClassify 列表转换为带有嵌套子列表的 MaterialClassifyVO 列表。这种转换通常用于构建树状结构的数据模型，其中 MaterialClassifyVO 表示节点，而 children 属性表示该节点的子节点列表。
     *
     * @return
     */
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
