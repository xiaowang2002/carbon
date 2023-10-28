package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.Material;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName MaterialMapper
 * @Description
 * @Author WangZhisheng
 * @Date 16:38 2023-10-27
 * @Version 11.0.15
 */
@Mapper
public interface MaterialMapper {
    List<Material> getMaterialListByClassifyId(Long id);

    void update(Material material);
}
