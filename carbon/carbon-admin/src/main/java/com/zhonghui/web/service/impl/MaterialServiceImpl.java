package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.MaterialMapper;
import com.zhonghui.web.pojo.Material;
import com.zhonghui.web.service.MaterialService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName MaterialServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 16:33 2023-10-27
 * @Version 17.0.8
 */
@Service
public class MaterialServiceImpl implements MaterialService {

    @Resource
    private MaterialMapper materialMapper;

    @Override
    public List<Material> getMaterialListByClassifyId(Long id) {
        return materialMapper.getMaterialListByClassifyId(id);
    }
}
