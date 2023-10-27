package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.Technology;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName TechnologyMapper
 * @Description
 * @Author Wang Zhisheng
 * @Date 13:08 2023-10-27
 * @Version 17.0.8
 */
@Mapper
public interface TechnologyMapper {
    List<Technology> list();
}
