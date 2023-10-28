package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.MaterialClassify;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName MaterialClassifyMapper
 * @Description
 * @Author WangZhisheng
 * @Date 16:38 2023-10-27
 * @Version 11.0.15
 */
@Mapper
public interface MaterialClassifyMapper {
    List<MaterialClassify> fetchMaterialClassifyData();

}
