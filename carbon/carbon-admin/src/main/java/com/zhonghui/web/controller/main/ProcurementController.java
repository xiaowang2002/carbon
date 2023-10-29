package com.zhonghui.web.controller.main;

import com.zhonghui.common.core.controller.BaseController;
import com.zhonghui.response.BaseResult;
import com.zhonghui.web.service.ProcurementService;
import org.apache.tomcat.jni.File;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName ProcurementController
 * @Description
 * @Author Wang Zhisheng
 * @Date 22:16 2023-10-28
 * @Version 17.0.8
 */
@RestController
@RequestMapping("/procurement")
public class ProcurementController extends BaseController {

    @Resource
    private ProcurementService procurementService;

    @PostMapping("/downloadFile")
    public BaseResult<Void> downloadFile(File fileName, HttpServletRequest request, HttpServletResponse response) {
        return BaseResult.success();
    }
}
