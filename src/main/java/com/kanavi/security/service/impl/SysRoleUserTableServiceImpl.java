package com.kanavi.security.service.impl;

import com.kanavi.security.entity.SysRoleUserTable;
import com.kanavi.security.mapper.SysRoleUserTableMapper;
import com.kanavi.security.service.SysRoleUserTableService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
@Service
public class SysRoleUserTableServiceImpl extends ServiceImpl<SysRoleUserTableMapper, SysRoleUserTable> implements SysRoleUserTableService {

    @Override
    public List<SysRoleUserTable> selectListByUserId(String user_id) {
        return this.baseMapper.selectListByUserId(user_id);
    }
}
