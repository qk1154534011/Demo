package com.backstage.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.backstage.pojo.Menu;
import com.backstage.pojo.MenuType;
import com.backstage.pojo.User;

public interface IMenuService {
	//按菜品类型查询所有菜品
	public List<Menu> byMenuType(String typeName);
	//查询所有菜品类型
	public List<MenuType> listMenuType();
	//登录
	public User byNameAndPwd(String name,String password);
	//注册
	public int addUser(User user);
	//按id查询该商品信息
	public Menu byId(Integer id);
}
