package com.oraclewdp.ddbookmarket.web;

import com.oraclewdp.ddbookmarket.biz.impl.AdminBizImpl;
import com.oraclewdp.ddbookmarket.model.Admin;
import com.oraclewdp.ddbookmarket.util.MyBeanUtils;
import org.apache.commons.collections.map.HashedMap;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、获取参数值
		Admin admin = new Admin();
		MyBeanUtils.populate(admin, request.getParameterMap());
    	//如果验证码不正确，流程不走
		String vcode=request.getParameter("vcode");
		String serverVcode=(String)request.getSession().getAttribute("validateCode");
		//不区分大小写
		/*if(!serverVcode.equalsIgnoreCase(vcode)){
			request.setAttribute("msg","验证码错误");
			request.setAttribute("admin",admin);
			request.getRequestDispatcher("login.jsp").forward(request,response);
			return;
		}
		//进行的交验
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();
		//违反的约束
		Set<ConstraintViolation<Admin>> validateResult=validator.validate(admin);
		if(validateResult.size()>0){//没有通过验证
			Map<String,String> errors=new HashMap<>();
			for (ConstraintViolation<Admin> cv:
				 validateResult) {
				errors.put(cv.getPropertyPath().toString(),cv.getMessage());
			}
			request.setAttribute("errors",errors);
			request.setAttribute("admin",admin);
			request.getRequestDispatcher("login.jsp").forward(request,response);
			return;
		}*/
		Map<String,String> errors=new HashMap<>();
		if(!serverVcode.equalsIgnoreCase(vcode)){
			errors.put("vcode","验证码错误");
		}
		//进行的交验
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();
		//违反的约束
		Set<ConstraintViolation<Admin>> validateResult=validator.validate(admin);
		if(validateResult.size()>0) {//没有通过验证
			for (ConstraintViolation<Admin> cv : validateResult) {
				errors.put(cv.getPropertyPath().toString(), cv.getMessage());
			}
		}
		if (errors.size()>0){
			request.setAttribute("errors",errors);
			request.setAttribute("admin",admin);
			request.getRequestDispatcher("login.jsp").forward(request,response);
			return;
		}
		//2、到数据库比对
		AdminBizImpl adminBiz = new AdminBizImpl();
		boolean ret = adminBiz.findByNameAndPwd(admin);
		//3、根据比对结果给用户一个页面
		if (ret) {
			//在session范围下记录下已经登录成功
			request.getSession().setAttribute("hasLogined",true);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		} else {
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
