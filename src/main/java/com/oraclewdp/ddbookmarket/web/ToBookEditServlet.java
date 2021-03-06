package com.oraclewdp.ddbookmarket.web;

import com.oraclewdp.ddbookmarket.biz.BookBiz;
import com.oraclewdp.ddbookmarket.biz.SmallTypeBiz;
import com.oraclewdp.ddbookmarket.biz.impl.BookBizImpl;
import com.oraclewdp.ddbookmarket.biz.impl.SmallTypeBizImpl;
import com.oraclewdp.ddbookmarket.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ToBookEditServlet",value = "/toBookEdit")
public class ToBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!(Boolean)request.getSession().getAttribute("hasLogined")){
            response.sendRedirect("login.jsp");
            return;
        }
        //1获取参数
        String strId=request.getParameter("id");
        int id=Integer.parseInt(strId);
        /*String strBid =request.getParameter("bid");
        int bid=Integer.parseInt(strBid);*/
        //2调用业务层
        BookBiz bookBiz=new BookBizImpl();
        Book book = bookBiz.findBookById(id);
        SmallTypeBiz smallTypeBiz=new SmallTypeBizImpl();
        int bid=smallTypeBiz.findBidById(book.getSid());
        //3这里回填数据库的
        request.setAttribute("book",book);
        request.setAttribute("bid",bid);
        request.getRequestDispatcher("bookEdit.jsp").forward(request,response);
    }
}






















