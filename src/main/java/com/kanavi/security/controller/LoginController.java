package com.kanavi.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
//    @RequestMapping("/login")
//    public String login(){
//        System.out.println("执行登录方法！");
//        return "redirect:main.html";
//    }

    @PostMapping("/toMain")
    public String toMain(){
        System.out.println("执行登录方法！");
        return "redirect:main.html";
    }

    @PostMapping("/toError")
    public String toError(){
        System.out.println("执行登录方法！");
        return "redirect:error.html";
    }

    @GetMapping("/demo")
    @ResponseBody
    public String demo(){
        System.out.println("执行登录方法！");
        return "demo";
    }
}
