package com.kanavi.security.mapper;

import com.kanavi.security.entity.SysRoleTable;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
public interface SysRoleTableMapper extends BaseMapper<SysRoleTable> {
    /**
     * 根据角色id查询角色信息
     * @param id
     * @return
     */
    @Select("select `role_id`,`role_name`,`description` from `security`.`sys_role_table` where role_id = #{id} ")
    SysRoleTable selectById(String id);
}
