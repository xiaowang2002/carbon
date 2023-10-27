package com.zhonghui.web.service;

import com.zhonghui.web.pojo.Technology;

import java.util.List;

/**
 * @ClassName TechnologyService
 * @Description
 * @Author WangZhisheng
 * @Date 13:06 2023-10-27
 * @Version 11.0.15
 */
public interface TechnologyService {

    /**
     * 查询所有工艺列表
     *
     * @return 查询结果
     */
    List<Technology> list();
}
