package com.zhonghui.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Material
 * @Description
 * @Author Wang Zhisheng
 * @Date 16:25 2023-10-27
 * @Version 17.0.8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Material {
    private Long id;
    private String materialCode;
    private String materialName;
    private String materialModel;
    private String materialSpecifications;
    private String materialUnit;
    private String materialPrice;
    private String materialType;
    private String remark;
}
