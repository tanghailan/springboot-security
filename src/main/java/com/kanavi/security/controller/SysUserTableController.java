package com.kanavi.security.controller;


import com.kanavi.security.entity.SysUserTable;
import com.kanavi.security.response.Result;
import com.kanavi.security.service.SysUserTableService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
@RestController
@RequestMapping("/security/sysUserTable")
public class SysUserTableController {
    @Resource
    private SysUserTableService userTableService;

    @GetMapping("/getUserList")
    public Result getUserList(){
        List<SysUserTable> list = userTableService.list();
        return Result.ok().data("users",list);
    }
}

