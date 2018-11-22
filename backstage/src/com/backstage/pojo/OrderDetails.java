package com.backstage.pojo;

public class OrderDetails {
	private Integer id;
	private String orderId;
	private String menuName;
	private Integer menuNum;
	private String menuPrice;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(Integer menuNum) {
		this.menuNum = menuNum;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	
}
