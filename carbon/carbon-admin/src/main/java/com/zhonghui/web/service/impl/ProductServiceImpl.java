package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.ProductMapper;
import com.zhonghui.web.mapper.TechnologyMapper;
import com.zhonghui.web.pojo.Product;
import com.zhonghui.web.request.TechnologyAndProductRequest;
import com.zhonghui.web.service.ProductService;
import com.zhonghui.web.vo.TechnologyAndProductVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName ProductServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 13:07 2023-10-27
 * @Version 17.0.8
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductMapper productMapper;

    @Resource
    private TechnologyMapper technologyMapper;

    @Override
    public List<TechnologyAndProductVO> list(String technologyName) {
        return productMapper.list(technologyName);
    }

    @Override
    public TechnologyAndProductVO getById(Long id) {
        return productMapper.getById(id);
    }

    @Override
    public Boolean edit(TechnologyAndProductRequest request) {
        technologyMapper.edit(request);
        return true;
    }

    @Override
    public String deleteById(Long id) {
        technologyMapper.deleteById(id);
        return null;
    }

    @Override
    public String add(TechnologyAndProductRequest request) {
        technologyMapper.add(request);
        return "";
    }

    @Override
    public List<Product> getAllProduct() {
        return productMapper.getAll();
    }
}
