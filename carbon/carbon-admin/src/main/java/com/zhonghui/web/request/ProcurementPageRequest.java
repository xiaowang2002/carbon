package com.zhonghui.web.request;

import lombok.Data;

/**
 * @ClassName ProcurementPageRequest
 * @Description
 * @Author Wang Zhisheng
 * @Date 22:22 2023-10-28
 * @Version 17.0.8
 */
@Data
public class ProcurementPageRequest {

    private Long pageSize;
    private Long pageIndex;
    /**
     * 类型 1公告，2法规，3动态
     */
    private Long type;
}
