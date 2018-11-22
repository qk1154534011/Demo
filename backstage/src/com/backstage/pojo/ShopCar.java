package com.backstage.pojo;

public class ShopCar {
		private int gPrice;
		private int num;
		private Menu menu;
		public int getgPrice() {
			return menu.getPrice()*this.num;
		}
		public void setgPrice(int gPrice) {
			this.gPrice = gPrice;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public Menu getMenu() {
			return menu;
		}
		public void setMenu(Menu menu) {
			this.menu = menu;
		}
		
		public ShopCar(Menu menu,int num) {
			this.menu=menu;
			this.num=num;
		};
			
		
}
