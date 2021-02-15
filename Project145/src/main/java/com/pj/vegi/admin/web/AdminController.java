package com.pj.vegi.admin.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.admin.service.AdminService;
import com.pj.vegi.common.Paging;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.ReportVo;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	//회원관리(전체조회)
	@RequestMapping("/adminMemberSelect.do")
	public String adminMemberSelect ( MemberVo vo, Model model, Paging paging, HttpSession session) throws SQLException {
		String mid = (String) session.getAttribute("mid");
		vo.setMId(mid);
		
		paging.setPageUnit(10); //페이징 행 개수
		paging.setPageSize(5); 
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		
		int cnt = adminService.countMember(vo);
		paging.setTotalRecord(cnt);
		
		List<MemberVo> adminMember = adminService.adminMemberSelect(vo);
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("vo", vo);
		model.addAttribute("paging", paging);
		
		return "admin/adminMemberList";
	}
	
	@ResponseBody
	@RequestMapping("/changeAvailable.do")
	public int changUnable (MemberVo vo) {
		return adminService.changAvailable(vo);
	}
	
	
	//식당관리(전체조회)
		@RequestMapping("/adminRestaurant.do")
		public String adminRestaurant ( RestaurantVo vo, Model model, Paging paging, HttpSession session) throws SQLException {
			String mid = (String) session.getAttribute("mid");
			vo.setMId(mid);
			
			paging.setPageUnit(10); //페이징 행 개수
			paging.setPageSize(5); 
			if (paging.getPage() == null) {
				paging.setPage(1);
			}
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			
			int cnt = adminService.countAdminRestaurant(vo);
			paging.setTotalRecord(cnt);
			
			List<RestaurantVo> adminRestaurant = adminService.adminRestaurant(vo);
			
			model.addAttribute("adminRestaurant", adminRestaurant);
			model.addAttribute("vo", vo);
			model.addAttribute("paging", paging);
			
			return "admin/adminRestaurantList";
		}
		
		
		//챌린지관리(전체조회)
		@RequestMapping("/adminBegiMeetReportList.do")
		public String adminBegiMeetReportList ( ReportVo vo, Model model, Paging paging, HttpSession session) throws SQLException {
			String mid = (String) session.getAttribute("mid");
			vo.setMId(mid);
			
			paging.setPageUnit(10); //페이징 행 개수
			paging.setPageSize(5); 
			if (paging.getPage() == null) {
				paging.setPage(1);
			}
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			
			int cnt = adminService.countAdminBegiMeetReportList(vo);
			paging.setTotalRecord(cnt);
			
			List<ReportVo> adminReport = adminService.adminBegiMeetReportList(vo);
			
			model.addAttribute("adminReport", adminReport);
			model.addAttribute("vo", vo);
			model.addAttribute("paging", paging);
			
			return "admin/adminBegeMeetReportList";
		}
}
