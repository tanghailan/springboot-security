package com.kanavi.security.service.auth;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.kanavi.security.entity.SysRoleTable;
import com.kanavi.security.entity.SysRoleUserTable;
import com.kanavi.security.entity.SysUserTable;
import com.kanavi.security.service.SysRoleTableService;
import com.kanavi.security.service.SysRoleUserTableService;
import com.kanavi.security.service.SysUserTableService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
@Slf4j
public class UserDetailsServiceImpl implements UserDetailsService {

    @Resource
    private SysUserTableService sysUserTableService;
    @Resource
    private SysRoleTableService sysRoleTableService;
    @Resource
    private SysRoleUserTableService sysRoleUserTableService;



    /**
     * 通过用户姓名查询用户信息
     * @param username 用户名
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //1.查询数据库判断用户名是否存在，如果不存在就抛出UsernameNotFoundException异常、
        if (StrUtil.isEmpty(username)){
            throw new UsernameNotFoundException("用户名不能为空!");
        }
        //用户不为空，根据用户名查询用户
        SysUserTable user = sysUserTableService.loadUserByUsername(username);
        if (!ObjectUtil.isNotNull(user)){
            throw new RuntimeException("用户不存在！");
        }
        log.info("进入了loadUserByUsername方法!用户信息为：{}",user.toString());

        //如果用户存在，则查询该用户具有的角色
        List<GrantedAuthority> authorities = new ArrayList<>();
        List<SysRoleUserTable> roles = sysRoleUserTableService.selectListByUserId(user.getUserId());
        roles.forEach(role->{
            SysRoleTable sysRoleTable = sysRoleTableService.selectById(role.getRoleId());
            authorities.add(new SimpleGrantedAuthority(sysRoleTable.getRoleName()));
        });
        //2.把查询出来的密码进行解析，或者直接把密码放入构造方法
        return new User(user.getUserName(),user.getPassWord(),authorities);
    }
}
