package com.zhonghui.web.vo;

import com.zhonghui.web.pojo.MaterialClassify;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @ClassName MaterialClassifyVO
 * @Description
 * @Author Wang Zhisheng
 * @Date 12:44 2023-10-28
 * @Version 17.0.8
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MaterialClassifyVO extends MaterialClassify {

    private List<MaterialClassify> children;
}
