package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.Technology;
import com.zhonghui.web.request.TechnologyAndProductRequest;
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

    void edit(TechnologyAndProductRequest request);

    void deleteById(Long id);

    void add(TechnologyAndProductRequest request);
}
