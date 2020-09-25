package com.kanavi.security.service;

import com.kanavi.security.entity.SysUserTable;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
public interface SysUserTableService extends IService<SysUserTable> {
    /**
     * 通过姓名查询用户
     * @param username
     * @return
     */
    SysUserTable loadUserByUsername(String username);

    /**
     * 通过id查询用户
     * @param id
     * @return
     */
    SysUserTable loadUserById(String id);
}
