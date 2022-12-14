package interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("pre handle..........................");

		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();

		System.out.println("Bean: " + method.getBean());
		System.out.println("Method: " + methodObj);

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		System.out.println("post handle........................");

		Object result = modelAndView.getModel().get("result");

		if (result != null) {
			System.out.println("result exists");
			request.getSession().setAttribute("result", result); // result를 세션에 넣고 
			response.sendRedirect("/doA"); // /doA로 보낸다
		}
	}
}

// @Override
// public void postHandle(HttpServletRequest request, HttpServletResponse
// response, Object handler,
// ModelAndView modelAndView) throws Exception {
//
// System.out.println("post handle.........");
//
// }

// @Override
// public boolean preHandle(HttpServletRequest request,
// HttpServletResponse response, Object handler) throws Exception {
//
// System.out.println("pre handle..........");
//
// return true;
// }