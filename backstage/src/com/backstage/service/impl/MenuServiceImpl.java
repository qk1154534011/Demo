package com.backstage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.backstage.dao.IMenuMapper;
import com.backstage.pojo.Menu;
import com.backstage.pojo.MenuType;
import com.backstage.pojo.User;
import com.backstage.service.IMenuService;
@Service
@Transactional
public class MenuServiceImpl implements IMenuService {
	@Autowired
	private IMenuMapper menuMapper;
	@Override
	public List<Menu> byMenuType(String typeName) {
		
		return menuMapper.byMenuType(typeName);
	}
	@Override
	public List<MenuType> listMenuType() {
		
		return menuMapper.listMenuType();
	}
	@Override
	public User byNameAndPwd(String name, String password) {
		
		return menuMapper.byNameAndPwd(name, password);
	}
	@Override
	public Menu byId(Integer id) {
		
		return menuMapper.byId(id);
	}
	@Override
	public int addUser(User user) {
		
		return menuMapper.addUser(user);
	}

}
