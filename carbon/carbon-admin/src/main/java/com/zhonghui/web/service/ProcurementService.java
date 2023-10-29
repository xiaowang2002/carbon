package com.zhonghui.web.service;

import com.zhonghui.web.pojo.Procurement;

import java.util.List;

/**
 * @ClassName ProcurementService
 * @Description
 * @Author WangZhisheng
 * @Date 22:17 2023-10-28
 * @Version 11.0.15
 */
public interface ProcurementService {
    List<Procurement> list(Long type);
}
