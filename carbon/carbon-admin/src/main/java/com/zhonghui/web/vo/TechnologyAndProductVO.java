package com.zhonghui.web.vo;

import com.zaxxer.hikari.util.ClockSource;
import com.zhonghui.web.pojo.Product;
import com.zhonghui.web.pojo.Technology;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @ClassName TechnologyAndProductVO
 * @Description
 * @Author Wang Zhisheng
 * @Date 13:12 2023-10-27
 * @Version 17.0.8
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TechnologyAndProductVO extends Technology {
    private String productName;
    private String productModel;
    private String productSku;
    private String productUnit;
}
