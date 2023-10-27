package com.zhonghui.web.controller.main;

import cn.hutool.core.bean.BeanUtil;
import com.zhonghui.common.core.controller.BaseController;
import com.zhonghui.response.BaseResult;
import com.zhonghui.web.mapper.ProductMapper;
import com.zhonghui.web.mapper.TechnologyMapper;
import com.zhonghui.web.pojo.Product;
import com.zhonghui.web.pojo.Technology;
import com.zhonghui.web.request.TechnologyAndProductRequest;
import com.zhonghui.web.service.ProductService;
import com.zhonghui.web.service.TechnologyService;
import com.zhonghui.web.vo.TechnologyAndProductVO;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName TechnologyController
 * @Description
 * @Author Wang Zhisheng
 * @Date 11:43 2023-10-27
 * @Version 17.0.8
 */
@RestController
@RequestMapping("/mes/technology")
public class TechnologyController extends BaseController {


    @Resource
    private ProductService productService;
    @Resource
    private TechnologyService technologyService;

    @GetMapping("/list")
    public BaseResult<List<TechnologyAndProductVO>> list(String technologyName) {
        this.startPage();
        List<TechnologyAndProductVO> productList = productService.list(technologyName);
        return BaseResult.success(productList);
    }

    @GetMapping("/{id}")
    public BaseResult<TechnologyAndProductVO> getById(@PathVariable Long id) {
        TechnologyAndProductVO vo = productService.getById(id);
        return BaseResult.success(vo);
    }

    @DeleteMapping("/{id}")
    public BaseResult<Void> delete(@PathVariable Long id) {
        return BaseResult.success(productService.deleteById(id));
    }

    @PutMapping
    public BaseResult<String> edit(@RequestBody TechnologyAndProductRequest request) {
        Boolean isSuccess = productService.edit(request);
        if (isSuccess) {
            return BaseResult.success("更新成功");
        } else {
            return BaseResult.success("更新失败");
        }
    }

    @PostMapping
    public BaseResult<Void> add(@RequestBody TechnologyAndProductRequest request) {
        return BaseResult.success(productService.add(request));
    }
}
