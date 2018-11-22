package com.backstage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.backstage.pojo.Menu;
import com.backstage.pojo.MenuType;
import com.backstage.pojo.User;


public interface IMenuMapper {
	//按菜品类型查询所有菜品
	public List<Menu> byMenuType(@Param("typeName") String typeName);
	//查询所有菜品类型
	public List<MenuType> listMenuType();
	//登录
	public User byNameAndPwd(@Param("name") String name,@Param("password") String password);
	//注册
	public int addUser(User user);
	//按id查询该商品信息
	public Menu byId(@Param("id") Integer id);
}
