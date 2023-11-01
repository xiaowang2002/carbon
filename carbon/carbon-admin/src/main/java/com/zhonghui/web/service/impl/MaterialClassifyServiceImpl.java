package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.MaterialClassifyMapper;
import com.zhonghui.web.pojo.MaterialClassify;
import com.zhonghui.web.pojo.MaterialClassifyEntity;
import com.zhonghui.web.service.MaterialClassifyService;
import com.zhonghui.web.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @ClassName MaterialClassifyServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 16:38 2023-10-27
 * @Version 17.0.8
 */
@Service
public class MaterialClassifyServiceImpl implements MaterialClassifyService {

    @Autowired
    private MaterialClassifyMapper materialClassifyMapper;


    @Override
    public List<MaterialClassify> list() {
        return materialClassifyMapper.fetchMaterialClassifyData();
    }

    @Override
    public List<MaterialClassifyEntity> buildTree() {
        return materialClassifyMapper.buildTree();
    }
}
