package com.backstage.service;

import java.util.List;

import com.backstage.pojo.Menu;
import com.backstage.pojo.Order;
import com.backstage.pojo.OrderDel;
import com.backstage.pojo.OrderDetails;

public interface IMenusService {
	//查询今日推荐菜品
	List<Menu> lsitHotMenus();
	//查询本店特色菜品
	List<Menu> lsitCarMenus();
	 //添加订单
	int addOrder(Order order);
	/**
	 * 添加订单详情
	 * @return
	 */
	int addOrderDetails(OrderDel orderDel);
	/**
	 * 查看订单
	 * @return
	 */
	List<Order> selectOrder(String userName);
	/**
	 *查看订单详情
	 * @return
	 */
	List<OrderDetails> selectOrderDetails(String orderId);
}
