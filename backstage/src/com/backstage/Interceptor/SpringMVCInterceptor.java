package com.backstage.Interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.backstage.pojo.User;

public class SpringMVCInterceptor extends HandlerInterceptorAdapter {
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean faly = false;
		System.out.println("222222");
		User user = (User)request.getSession().getAttribute("user");
		if(user != null) {
			faly = true;
			return faly;
		}
		PrintWriter out = response.getWriter();
		out.print(faly);
		out.flush();
		out.close();
		return faly;
	}
}
