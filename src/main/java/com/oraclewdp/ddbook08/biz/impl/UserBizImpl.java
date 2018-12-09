package com.oraclewdp.ddbook08.biz.impl;

import com.oraclewdp.ddbook08.biz.UserBiz;
import com.oraclewdp.ddbook08.dao.UserDao;
import com.oraclewdp.ddbook08.dao.impl.UserDaoJdbcImpl;

public class UserBizImpl implements UserBiz {
    @Override
    public boolean findUserByNameAndPwd(String name, String pwd) {
        UserDao userDao=new UserDaoJdbcImpl();
        return userDao.find(name,pwd);
    }
}
