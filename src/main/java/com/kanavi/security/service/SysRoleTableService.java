package com.kanavi.security.service;

import com.kanavi.security.entity.SysRoleTable;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
public interface SysRoleTableService extends IService<SysRoleTable> {
    /**
     * 根据角色id查询角色信息
     * @param id
     * @return
     */
    SysRoleTable selectById(String id);
}
