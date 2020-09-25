package com.kanavi.security.mapper;

import com.kanavi.security.entity.SysRoleUserTable;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
public interface SysRoleUserTableMapper extends BaseMapper<SysRoleUserTable> {
    /**
     * 根据用户id查询角色的集合
     * @param user_id
     * @return
     */
    @Select("SELECT \n" +
            "  `id`,\n" +
            "  `role_id`,\n" +
            "  `user_id` \n" +
            "FROM\n" +
            "  `security`.`sys_role_user_table` where user_id = #{user_id}")
    List<SysRoleUserTable> selectListByUserId(String user_id);
}
