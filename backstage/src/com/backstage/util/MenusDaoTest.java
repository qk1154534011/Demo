package com.backstage.util;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.backstage.dao.IMenusMapper;
import com.backstage.pojo.Menu;

public class MenusDaoTest {
	@Autowired
	private IMenusMapper mm;
	
	@Test
	public void queryAHotList() {
		List<Menu> listHotMenu = mm.lsitHotMenus();
		for (Menu menu : listHotMenu) {
			System.out.println(menu.getId());
		}
	}
}
