package com.atguigu.crowd.mvc.config;

import com.atguigu.crowd.constant.CrowdConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

@Configuration // 当前类为配置类
@EnableWebSecurity  // 启用web环境下权限控制功能
public class WebAppSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private MyPasswordEncoder passwordEncoder;


    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    protected void configure(AuthenticationManagerBuilder builder) throws Exception {
        // 与 SpringSecurity 环境下用户登录相关
        builder
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder); // md5比较
        // .passwordEncoder(NoOpPasswordEncoder.getInstance()); // 登录时明文比较
    }

    @Override
    protected void configure(HttpSecurity security) throws Exception {
        // 与 SpringSecurity 环境下请求授权相关
        security
                .authorizeRequests()                            // 对请求进行授权
                .antMatchers("/admin/to/login.do")  // 针对登录页进行设置
                .permitAll()
                .antMatchers("/bootstrap/**")       // 针对静态资源进行设置， 无条件访问
                .permitAll()
                .antMatchers("/css/**")
                .permitAll()
                .antMatchers("/fonts/**")
                .permitAll()
                .antMatchers("/img/**")
                .permitAll()
                .antMatchers("/jquery/**")
                .permitAll()
                .antMatchers("/js/**")
                .permitAll()
                .antMatchers("/layer/**")
                .permitAll()
                .antMatchers("/script/**")
                .permitAll()
                .antMatchers("/ztree/**")
                .permitAll()
                .anyRequest()
                .authenticated()
                .and()
                .exceptionHandling()
                .accessDeniedHandler((request, response, e) -> {
                    request.setAttribute("exception", new Exception(CrowdConstant.MESSAGE_ACCESS_DENIED));
                    request.getRequestDispatcher("/WEB-INF/system-error.jsp").forward(request, response);
                })
                .and()
                .csrf().disable()                               // 关闭防跨站请求伪造
                .formLogin()                                    // 开启表单登录功能
                .loginPage("/admin/to/login.do")                // 指定登录页面
                .loginProcessingUrl("/security/do/login.do")    // 指定处理登录请求的地址
                .defaultSuccessUrl("/admin/to/main.do")         // 指定登录成功后前往的地址
                .usernameParameter("loginAcct")                 // 账号的请求参数名称
                .passwordParameter("userPswd")                  // 密码的请求参数名称
                .and()
                .logout()                                       // 退出登录功能
                .logoutUrl("/security/do/logout.do")
                .logoutSuccessUrl("/admin/to/login.do")
        ;

    }
}