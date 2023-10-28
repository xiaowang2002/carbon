package com.zhonghui.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @ClassName MaterialClassify
 * @Description
 * @Author Wang Zhisheng
 * @Date 16:25 2023-10-27
 * @Version 17.0.8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MaterialClassify {
    private Long id;
    private Long pid;
    private String name;
    private String code;
    private String remark;
}
