package com.kanavi.security.auth;

import com.kanavi.security.handle.MyAccessDeniedHandler;
import com.kanavi.security.handle.MyAuthenticationFailureHandler;
import com.kanavi.security.handle.MyAuthenticationSuccessHandler;
import com.kanavi.security.service.auth.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import javax.sql.DataSource;


@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true,securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

    @Autowired
    private UserDetailsServiceImpl userDetailsService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private DataSource dataSource;
    @Autowired
    private PersistentTokenRepository tokenRepository;
    @Autowired
    private MyAccessDeniedHandler myAccessDeniedHandler;

    @Bean
    public PersistentTokenRepository persistentTokenRepository(){
        JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
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
    public void configure(WebSecurity web) {
        //设置哪些文件夹不被拦截，一般用来做对静态资源放行
        web.ignoring().antMatchers("/css/**,/js/**,/images/**");
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
                .antMatchers("/css/**,/js/**,/images/**").permitAll()
                //如果有允许的url在这里配置
                .antMatchers("/login.html").permitAll()
                //如果有允许的url在这里配置
                .antMatchers("/error.html").permitAll()
                //任何请求都需要被认证
                .antMatchers("/demo").permitAll()
                .anyRequest().authenticated()



                .and()
                .formLogin()
                .loginProcessingUrl("/login")
                //设置登录页面
                .loginPage("/login.html")
                //登录成功后的处理器，不能和successForwardUrl共存
                .successHandler(new MyAuthenticationSuccessHandler("http://baidu.com"))
                //登录成功后的跳转页面  必须是post请求
//                .successForwardUrl("/toMain")
                //登录失败后的处理器，不能和failureForwardUrl共存
                .failureHandler(new MyAuthenticationFailureHandler("error.html"))
                //登录失败后的跳转页面  必须是post请求
//                .failureForwardUrl("/toError")
//                .usernameParameter("username")
//                .passwordParameter("password")



                .and()
                //注销操作
                .logout().permitAll()


                .and()
                .rememberMe()
                //使用jdbc的方式存储token
                .tokenRepository(tokenRepository)
                .tokenValiditySeconds(60)
                .userDetailsService(userDetailsService);

        //关闭csrf跨域
        http.csrf().disable();
    }
}
