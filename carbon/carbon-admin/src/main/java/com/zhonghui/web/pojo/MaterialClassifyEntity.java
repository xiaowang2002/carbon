package com.zhonghui.web.pojo;

import lombok.Data;

import java.util.List;

/**
 * @ClassName MaterialClassifyEntity
 * @Description
 * @Author Wang Zhisheng
 * @Date 10:42 2023-10-31
 * @Version 17.0.8
 */
@Data
public class MaterialClassifyEntity {
    private Long id;
    private Long pid;
    private String name;
    private String code;
    private String remark;
    private List<MaterialClassifyEntity> list;
}
