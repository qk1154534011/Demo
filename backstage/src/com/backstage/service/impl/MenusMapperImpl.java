package com.backstage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backstage.dao.IMenusMapper;
import com.backstage.pojo.Menu;
import com.backstage.pojo.Order;
import com.backstage.pojo.OrderDel;
import com.backstage.pojo.OrderDetails;
import com.backstage.service.IMenusService;

@Service
public class MenusMapperImpl implements IMenusService {
	@Autowired
	private IMenusMapper mm;
	
	@Override
	public List<Menu> lsitHotMenus() {
		
		return mm.lsitHotMenus();
	}

	@Override
	public List<Menu> lsitCarMenus() {
		
		return mm.lsitCarMenus();
	}

	@Override
	public int addOrder(Order order) {
		
		return mm.addOrder(order);
	}

	@Override
	public int addOrderDetails(OrderDel orderDel) {
	
		return mm.addOrderDetails(orderDel);
	}

	@Override
	public List<Order> selectOrder(String userName) {
		
		return mm.selectOrder(userName);
	}

	@Override
	public List<OrderDetails> selectOrderDetails(String orderId) {
		
		return mm.selectOrderDetails(orderId);
	}

}
