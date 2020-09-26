package com.kanavi.security.handle;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author hailan
 * @version 1.0
 * @className MyAccessDeniedHandler
 * @description TODO
 * @date 2020-09-26 19:23
 */
@Component
public class MyAccessDeniedHandler extends JSONAuthentication implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        this.WriteJSON(request,response,"请求失败！");
    }
}
