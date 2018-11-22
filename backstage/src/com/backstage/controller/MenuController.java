package com.backstage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.backstage.pojo.Menu;
import com.backstage.pojo.MenuType;
import com.backstage.pojo.Order;
import com.backstage.pojo.OrderDel;
import com.backstage.pojo.OrderDetails;
import com.backstage.pojo.ShopCar;
import com.backstage.pojo.User;
import com.backstage.service.IMenuService;
import com.backstage.service.IMenusService;

@Controller
@RequestMapping("menu")
public class MenuController {

	@Autowired
	private IMenuService menuService;
	@Autowired
	private IMenusService ms;

	//映射首页面
	@RequestMapping("showMenu")
	public String showMenu(Model model) {
		List<MenuType> listMenuType = menuService.listMenuType();
		model.addAttribute("listMenuType", listMenuType);
		return "index";
	}

	//映射登录页面
	@RequestMapping("login")
	public String login(Model model) {
		return "login";
	}

	//映射注册页面
	@RequestMapping("register")
	public String register(Model model) {
		return "register";
	}

	//映射首按类型查询菜单
	@RequestMapping("listing")
	public String selectMenu(@RequestParam(value="typeName",required=false) String typeName,Model model) {
		System.out.println(typeName);
		List<MenuType> listMenuType = menuService.listMenuType();
		model.addAttribute("listMenuType", listMenuType);
		if(typeName == "null") {
			typeName=null;
		}

		List<Menu> byMenuType = menuService.byMenuType(typeName);
		model.addAttribute("typeName", typeName);
		model.addAttribute("byMenuType", byMenuType);
		return "listing";
	}

	//登录验证
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public String loginUser(@RequestParam(value="userName",required=false) String userName,@RequestParam(value="userPwd",required=false) String userPwd,HttpSession session) {
		System.out.println(userName);
		System.out.println(userPwd);
		User user = menuService.byNameAndPwd(userName, userPwd);
		Map<String,Object> resultModel = new HashMap<String, Object>();
		if(user != null) {
			resultModel.put("success", true);
			session.setAttribute("user", user);
		}else {
			resultModel.put("success", false);
		}
		String str = JSONArray.toJSONString(resultModel);
		return str; 
	}

	//注册验证
	@RequestMapping(value="do_register",method=RequestMethod.POST)
	@ResponseBody
	public String registerUser(
			@RequestParam(value="userName",required=false) String userName,
			@RequestParam(value="userPwd",required=false) String userPwd,
			@RequestParam(value="userPhone",required=false) String userPhone,
			@RequestParam(value="userAddress",required=false) String userAddress,
			HttpSession session) {
		System.out.println(userName);
		System.out.println(userPwd);
		System.out.println(userPhone);
		System.out.println(userAddress);
		User user = new User();
		user.setName(userName);
		user.setPassword(userPwd);
		user.setPhone(userPhone);
		user.setAddress(userAddress);
		int addUser = menuService.addUser(user);
		Map<String,Object> resultModel = new HashMap<String, Object>();
		if(addUser >= 1) {
			resultModel.put("success",true);
		}else {
			resultModel.put("success",false);
		}
		String str = JSONArray.toJSONString(resultModel);
		return str; 
	}

	//进入购物车页面
	@RequestMapping("shopping")
	public String shopping() {
		return "shopping";
	}

	//进入订单页面
	@RequestMapping("order")
	public String order(String name,Model model) {
		System.out.println(name);
		List<Order> order = ms.selectOrder(name);
		model.addAttribute("order",order);
		return "order";
	}

	//进入订单详情页面
	@RequestMapping("orderdetails")
	public String orderdetails(String orderId,Model model) {
		System.out.println(orderId);
		List<OrderDetails> OrderDetails = ms.selectOrderDetails(orderId);
		model.addAttribute("OrderDetails", OrderDetails);
		return "orderdetails";
	}

	//添加购物车
	@RequestMapping("putCar")
	public String putCar(Integer id,HttpServletRequest request,HttpSession session,HttpServletResponse resp) {
		resp.setContentType("text/html");
		//得到编号
		System.out.println(id);
		//通过编号得到商品的所有信息
		Menu byId = menuService.byId(id);
		//将商品放入购物车
		//map集合 就是购物车
		// map<键,值> 商品编号作为键 商品项作为值
		//1.判断是否存在购物车
		//购物车是放在session中的
		//从session去取购物车
		Map<String,ShopCar> gwc = (Map<String,ShopCar>)request.getSession().getAttribute("gwc");
		//判断是否存在
		if(gwc==null){
			//创建购物车
			gwc = new HashMap<String, ShopCar>();
		} if(gwc.containsKey(id.toString())){
			//存在
			//设置数量+1
			//通过键 获得值
			//键为商品编号 值为商品项 商品项里面包含商品对象信息 和数量信息
			ShopCar spx = gwc.get(id.toString());
			//得到原来的数量
			int yldsl = spx.getNum();
			//在原来的数量上+1
			gwc.get(id.toString()).setNum(yldsl+1);

		}else{
			//不存在
			//创建一个新的商品项 数量为1
			ShopCar gi = new ShopCar(byId, 1);

			//将此商品项放入gwc
			gwc.put(id.toString(), gi);
		}
		//将购物车放入session
		request.getSession().setAttribute("gwc", gwc);			   

		return "shopping";
	}

	//删除购物车中选中的商品
	@RequestMapping("closeShopping")
	public String closeShopping(String id,HttpSession session,HttpServletRequest request) {
		System.out.println("id"+id);
		Map<String,ShopCar> gwc = (Map<String,ShopCar>)request.getSession().getAttribute("gwc");
		gwc.remove(id);
		request.getSession().setAttribute("gwc", gwc);
		return "shopping";
	}

	//获得商品总价
	@RequestMapping("count")
	@ResponseBody
	public String allPrice(HttpServletRequest request) {
		Map<String,Object> resultModel = new HashMap<String, Object>();
		int count = 0;
		//购物车
		Map<String,ShopCar> gwc = (Map<String,ShopCar>)request.getSession().getAttribute("gwc");
		if(gwc!=null) {
			for (ShopCar sc : gwc.values()) {
				count+=sc.getgPrice();
			}	
			resultModel.put("successs", true);
		}else {
			resultModel.put("successs",false);
		}

		resultModel.put("count", count);
		String str = JSONArray.toJSONString(resultModel);
		return str;
	}
	//结算
	@RequestMapping(value="overPrice",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String overPrice(String count,HttpServletRequest request) {
		Map<String,Object> resultModel = new HashMap<String, Object>();
		System.out.println("count"+count);
		User user = (User)request.getSession().getAttribute("user");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		//生成随机数
		Random random = new Random();
		int x=(int)(Math.random()*100000);
		String orderId = "A"+x;
		Order order = new Order();
		order.setOrderId(orderId);
		order.setOrderTime(df.format(new Date()));
		order.setPay(1);
		
		order.setTotalPrice(count);
		if(user != null) {
			order.setUserName(user.getName());
			int addOrder = ms.addOrder(order);
			if(addOrder >=1) {
				Map<String,ShopCar> gwc = (Map<String,ShopCar>)request.getSession().getAttribute("gwc");
				for (ShopCar sc : gwc.values()) {
					OrderDel orderDel = new OrderDel();
					orderDel.setMenuName(sc.getMenu().getMenuName());
					orderDel.setMenuNum(sc.getNum());
					orderDel.setMenuPrice(sc.getMenu().getPrice());
					orderDel.setOrderId(orderId);
					int add = ms.addOrderDetails(orderDel);
				}
				gwc.clear();
				request.getSession().setAttribute("gwc", gwc);
				resultModel.put("successs", true);
			}

		}else {
			resultModel.put("successs",false);
		}
		String str = JSONArray.toJSONString(resultModel);
		return str;
	}
	//退出
	@RequestMapping("ext")
	public void ext(HttpServletResponse response,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session.removeAttribute("user");
		out.println("<script>");
		out.print("alert('退出成功');");
		out.println("location.href=\"showMenu\"");
		out.println("</script>");
	}

}
