package com.kanavi.security.service.impl;

import com.kanavi.security.entity.SysRoleTable;
import com.kanavi.security.mapper.SysRoleTableMapper;
import com.kanavi.security.service.SysRoleTableService;
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
public class SysRoleTableServiceImpl extends ServiceImpl<SysRoleTableMapper, SysRoleTable> implements SysRoleTableService {

    @Override
    public SysRoleTable selectById(String id) {
        return this.baseMapper.selectById(id);
    }
}
