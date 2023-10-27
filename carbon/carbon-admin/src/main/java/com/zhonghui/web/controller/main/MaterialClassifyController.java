package com.zhonghui.web.controller.main;

import com.zhonghui.web.pojo.Material;
import com.zhonghui.web.pojo.MaterialClassify;
import com.zhonghui.web.service.MaterialClassifyService;
import com.zhonghui.web.service.MaterialService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//    @GetMapping("/tree")
//    public List<Material> buildTree() {
//        List<Material> materials = new ArrayList<>();
//        List<MaterialClassify> classifyList = materialClassifyService.fetchMaterialClassifyData();
//
//        Map<Long, Material> materialMap = new HashMap<>();
//
//        for (MaterialClassify classify : classifyList) {
//            Material material = new Material(classify.getId(), classify.getName());
//            material.setChildren(new ArrayList<>());
//            materialMap.put(classify.getId(), material);
//        }
//
//        for (MaterialClassify classify : classifyList) {
//            Material material = materialMap.get(classify.getId());
//            if (classify.getPid() == 0) {
//                materials.add(material);
//            } else {
//                Material parent = materialMap.get(classify.getPid());
//                if (parent != null) {
//                    parent.getChildren().add(material);
//                }
//            }
//        }
//        return materials;
//    }

}
