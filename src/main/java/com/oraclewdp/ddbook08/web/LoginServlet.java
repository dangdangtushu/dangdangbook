package com.oraclewdp.ddbook08.web;

import com.oraclewdp.ddbook08.biz.UserBiz;
import com.oraclewdp.ddbook08.biz.impl.UserBizImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1
            String pwd=request.getParameter("pwd");
            String name=request.getParameter("name");
        //2
        UserBiz userBiz=new UserBizImpl();
        boolean ret=userBiz.findUserByNameAndPwd(name,pwd);
        //3
    }
}



















