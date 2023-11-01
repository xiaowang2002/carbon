package com.zhonghui.web.service;

import com.zhonghui.web.pojo.Product;
import com.zhonghui.web.request.TechnologyAndProductRequest;
import com.zhonghui.web.vo.ProductAndConsumptionVO;
import com.zhonghui.web.vo.TechnologyAndProductVO;

import java.util.List;

/**
 * @ClassName ProductService
 * @Description
 * @Author WangZhisheng
 * @Date 13:07 2023-10-27
 * @Version 11.0.15
 */
public interface ProductService {
    /**
     * 列表查询
     *
     * @return 查询结果
     */
    List<TechnologyAndProductVO> list(String technologyName);

    TechnologyAndProductVO getById(Long id);

    Boolean edit(TechnologyAndProductRequest request);

    String deleteById(Long id);

    String add(TechnologyAndProductRequest request);

    List<Product> getAllProduct();

    List<ProductAndConsumptionVO> getList();

}
