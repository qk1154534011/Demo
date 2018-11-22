package com.backstage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.backstage.pojo.Menu;
import com.backstage.pojo.ShopCar;
import com.backstage.service.IMenuService;
import com.backstage.service.IMenusService;

@Controller
@RequestMapping("/index")
public class MenusController {
	@Autowired
	private IMenusService ms;
	@Autowired
	private IMenuService menuService;
	/**
	 * 今日特价菜单
	 * @return
	 */
	@RequestMapping(value="list",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String menusHotList() {
		Map<String,Object> resultModel = new HashMap<String, Object>();
		List<Menu> listMenus = ms.lsitHotMenus();
		if(listMenus!=null) {
			resultModel.put("success", true);
			resultModel.put("list", listMenus);
		}else {
			resultModel.put("seuccess", false);
		}
		String str = JSONArray.toJSONString(resultModel);
		return str;
	}
	/**
	 * 本店特色菜单
	 * @return
	 */
	@RequestMapping(value="end",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String menusCarList() {
		Map<String,Object> resultModel = new HashMap<String, Object>();
		List<Menu> listMenus = ms.lsitCarMenus();
		if(listMenus!=null) {
			resultModel.put("success", true);
			resultModel.put("list", listMenus);
		}else {
			resultModel.put("seuccess", false);
		}
		String str = JSONArray.toJSONString(resultModel);
		return str;
	}
	//添加购物车
	@RequestMapping(value="putCar",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String putCar(Integer id,HttpServletRequest request,HttpSession session,HttpServletResponse resp) {
		resp.setContentType("text/html");
		Map<String,Object> resultModel = new HashMap<String, Object>();
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
		resultModel.put("success", true);
		String str = JSONArray.toJSONString(resultModel);
		return str;
	}
}
