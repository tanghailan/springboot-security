package com.kanavi.security.auth;

import com.kanavi.security.service.auth.UserDetailsServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.annotation.Resource;
import javax.sql.DataSource;


@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

    @Resource
    private UserDetailsServiceImpl userDetailsService;
    @Resource
    private PasswordEncoder passwordEncoder;
    @Resource
    private DataSource dataSource;
    @Resource
    private PersistentTokenRepository tokenRepository;

    @Bean
    public PersistentTokenRepository persistentTokenRepository(){
        JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();;
        tokenRepository.setDataSource(dataSource);
        //如果token表不存在,使用下面语句跨域初始化该表，若存在请注释
//        tokenRepository.setCreateTableOnStartup(true);
        return tokenRepository;
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        //设置哪些文件夹不被拦截，一般用来做对静态资源放行
        web.ignoring().antMatchers("/css/**,/js/**");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //改用我们刚才重写的认证流程
        auth.userDetailsService(userDetailsService)
        .passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //设置http的认证方式
        http.authorizeRequests()
                //如果有允许的url在这里配置
//                .antMatchers().permitAll()
                //任何请求都需要被认证
                .anyRequest().authenticated()
                .and()
                //设置登录页面
                .formLogin().loginPage("/login")
//                .usernameParameter("username")
//                .passwordParameter("password")

                .defaultSuccessUrl("/").permitAll()
                .and()
                //注销操作
                .logout().permitAll()
                .and().rememberMe()
                //使用jdbc的方式存储token
                .tokenRepository(tokenRepository)
                .tokenValiditySeconds(60)
                .userDetailsService(userDetailsService);

        //关闭csrf跨域
        http.csrf().disable();
    }
}
