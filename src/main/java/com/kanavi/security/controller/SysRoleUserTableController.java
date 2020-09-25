package com.kanavi.security.controller;


import com.kanavi.security.entity.SysRoleUserTable;
import com.kanavi.security.response.Result;
import com.kanavi.security.service.SysRoleUserTableService;
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
@RequestMapping("/security/sysRoleUserTable")
public class SysRoleUserTableController {
    @Resource
    private SysRoleUserTableService userTableService;

    @GetMapping("/getUserList")
    public Result getUserList(){
        List<SysRoleUserTable> list = userTableService.list();
        return Result.ok().data("users",list);

    }


}

