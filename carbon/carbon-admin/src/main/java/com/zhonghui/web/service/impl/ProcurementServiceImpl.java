package com.zhonghui.web.service.impl;

import com.zhonghui.web.mapper.ProcurementMapper;
import com.zhonghui.web.pojo.Procurement;
import com.zhonghui.web.service.ProcurementService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName ProcurementServiceImpl
 * @Description
 * @Author Wang Zhisheng
 * @Date 22:17 2023-10-28
 * @Version 17.0.8
 */
@Service
public class ProcurementServiceImpl implements ProcurementService {

    @Resource
    private ProcurementMapper procurementMapper;

    @Override
    public List<Procurement> list(Long type) {
        return procurementMapper.list(type);
    }
}
