package com.kanavi.security.service.impl;

import com.kanavi.security.entity.SysUserTable;
import com.kanavi.security.mapper.SysUserTableMapper;
import com.kanavi.security.service.SysUserTableService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author My
 * @since 2020-09-25
 */
@Service
public class SysUserTableServiceImpl extends ServiceImpl<SysUserTableMapper, SysUserTable> implements SysUserTableService {

    @Override
    public SysUserTable loadUserByUsername(String username) {
        return this.baseMapper.loadUserByUsername(username);
    }

    @Override
    public SysUserTable loadUserById(String id) {
        return this.baseMapper.loadUserByUsername(id);
    }
}
