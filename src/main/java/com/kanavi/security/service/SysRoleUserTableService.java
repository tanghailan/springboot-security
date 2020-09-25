package com.kanavi.security.service;

import com.kanavi.security.entity.SysRoleUserTable;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
public interface SysRoleUserTableService extends IService<SysRoleUserTable> {
    /**
     * 根据用户id查询角色的集合
     * @param user_id
     * @return
     */
    List<SysRoleUserTable> selectListByUserId(String user_id);
}
