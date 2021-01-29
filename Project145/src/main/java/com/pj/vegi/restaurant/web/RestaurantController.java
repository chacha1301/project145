package com.pj.vegi.restaurant.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.restaurant.service.RestaurantService;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService restaurantService;

	//식당 메인 페이지
	@RequestMapping("/restaurant.do")
	public String restaurantMain(Model model, RestaurantVo vo) {
		List<RestaurantVo> restaurants = restaurantService.getRestaurantList(vo);
		model.addAttribute("restaurants", restaurants);
		return "restaurant/restaurantList";
	}

	@RequestMapping("/restaurantForm.do")
	public String restaurantForm() {

		return "restaurant/restaurantInsert";
	}

	@ResponseBody
	// ajax 로 받아 올 때 @ResponseBody 필요
	@RequestMapping("/restNameSerchList.do")
	public List<RestaurantVo> restChek(@RequestParam String restName, RestaurantVo vo) {
		// 일반 사용자 식당등록 페이지에서 식당이름 검색

		System.out.println(restName + "식당이름");
		return restaurantService.restNameSerchList(restName);
	}

	@RequestMapping("/restInsert.do")
	public String restaurantInsert(RestaurantVo vo, RestMenuVo menuListVo, Model model, HttpSession session) throws SQLException {
		System.out.println(menuListVo);
		int n = restaurantService.restInsert(vo);
		if (n != 0)  {
			List<RestMenuVo> menuList = menuListVo.getMenuVoList();
			for(RestMenuVo menuVo : menuList) {
				menuVo.setRestId(vo.getRestId());
				System.out.println(menuVo);
				restaurantService.menuInsert(menuVo);
			}
			model.addAttribute("result", "성공");
			return "redirect:/restaurant.do";
		}else {
			model.addAttribute("result", "실패");
			return "redirect:/restaurant.do";
			
		}
	
	}
	
	//식당 한 건 상세페이지
	@RequestMapping("/restaurantDetail.do")
	public String restaurantDetail(RestaurantVo rVo, Model model, HttpSession session ) {
		RestaurantVo restaurantVo = restaurantService.getRestaurantDetail(rVo);
		
		RestMenuVo mVo = new RestMenuVo();
		mVo.setRestId(restaurantVo.getRestId());
		List<RestMenuVo> menuList = restaurantService.getRestaurantMenu(mVo);
		
		model.addAttribute("rVo", restaurantVo);
		model.addAttribute("menuList" ,menuList);
		
		return "restaurant/restaurantImformation";
	}
	

}
