package com.zhonghui.web.controller.main;

import ch.qos.logback.core.joran.spi.HostClassAndPropertyDouble;
import cn.hutool.core.bean.BeanUtil;
import com.zhonghui.response.BaseResult;
import com.zhonghui.web.pojo.Product;
import com.zhonghui.web.service.ProductService;
import com.zhonghui.web.vo.TechnologyAndProductVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @ClassName ProductController
 * @Description
 * @Author Wang Zhisheng
 * @Date 8:11 2023-10-28
 * @Version 17.0.8
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ProductService productService;

    @GetMapping("/list")
    public BaseResult<List<Product>> list() {
        List<Product> list = productService.getAllProduct();
        return BaseResult.success(list);
    }
}
