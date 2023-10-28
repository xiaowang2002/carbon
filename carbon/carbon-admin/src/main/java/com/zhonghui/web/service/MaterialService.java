package com.zhonghui.web.service;

import com.zhonghui.web.pojo.Material;

import java.util.List;

/**
 * @ClassName MaterialService
 * @Description
 * @Author WangZhisheng
 * @Date 16:32 2023-10-27
 * @Version 11.0.15
 */
public interface MaterialService {
    List<Material> getMaterialListByClassifyId(Long id);
}
