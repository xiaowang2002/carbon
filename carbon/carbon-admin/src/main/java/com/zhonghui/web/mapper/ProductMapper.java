package com.zhonghui.web.mapper;

import com.zhonghui.web.pojo.Product;
import com.zhonghui.web.request.TechnologyAndProductRequest;
import com.zhonghui.web.vo.TechnologyAndProductVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName ProductMapper
 * @Description
 * @Author WangZhisheng
 * @Date 13:08 2023-10-27
 * @Version 11.0.15
 */
@Mapper
public interface ProductMapper {
    List<TechnologyAndProductVO> list();

    TechnologyAndProductVO getById(Long id);

    int edit(TechnologyAndProductRequest request);
}
