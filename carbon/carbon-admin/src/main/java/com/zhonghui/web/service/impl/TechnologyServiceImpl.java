package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.TechnologyMapper;
import com.zhonghui.web.pojo.Technology;
import com.zhonghui.web.service.TechnologyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName TechnologyServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 13:06 2023-10-27
 * @Version 17.0.8
 */
@Service
public class TechnologyServiceImpl implements TechnologyService {

    @Resource
    private TechnologyMapper technologyMapper;

    @Override
    public List<Technology> list() {
        return technologyMapper.list();
    }


}
