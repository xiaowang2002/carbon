package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.Procurement;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName ProcumentMapper
 * @Description
 * @Author WangZhisheng
 * @Date 22:18 2023-10-28
 * @Version 11.0.15
 */
@Mapper
public interface ProcurementMapper {
    List<Procurement> list(Long type);
}
