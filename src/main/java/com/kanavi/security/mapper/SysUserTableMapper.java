package com.kanavi.security.mapper;

import com.kanavi.security.entity.SysUserTable;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
public interface SysUserTableMapper extends BaseMapper<SysUserTable> {
    /**
     * 通过姓名查询用户
     * @param username
     * @return
     */
    SysUserTable loadUserByUsername(@Param("username") String username);

    /**
     * 通过id查询用户
     * @param id
     * @return
     */
    SysUserTable loadUserById(@Param("id") String id);
}
