package com.lh.super_market.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.super_market.entity.Staff;
import com.lh.super_market.service.impl.StaffServiceImpl;

@Controller
@RequestMapping("/staff")
public class StaffController {

	@Autowired
	private StaffServiceImpl staffServiceImpl;
	
	@RequestMapping("/staffList.do")
	public String query(Model model){
		List<Staff> list = staffServiceImpl.query();
		model.addAttribute("list", list);
		return "staff/list";
	}
	
	@RequestMapping(value = "/addStaff.do", method = RequestMethod.GET)
	public String addStaff(){
		return "staff/add";
	}
	
	@RequestMapping(value = "/addStaff.do", method = RequestMethod.POST)
	public String addStaffInfo(Staff staff){
		staffServiceImpl.add(staff);
		return "staff/add";
	}
	
	@RequestMapping(value = "/updateStaff.do", method = RequestMethod.GET)
	public String upStaff(String id, Model model){
		Map<String,String> map = new HashMap<String,String>();
		map.put("strWhere", "staff_id="+id);
		List<Staff> list = staffServiceImpl.queryByStr(map);
		model.addAttribute("staff", list.get(0));
		return "staff/update";
	}
	
	@RequestMapping(value = "/updateStaff.do", method = RequestMethod.POST)
	public String upStaffInfo(Staff staff, HttpServletResponse response){
		boolean b = staffServiceImpl.update(staff);
		outStr(b, response);
		return null;
	}
	
	@RequestMapping(value = "/deleteStaff.do", method = RequestMethod.GET)
	public String deleteStaff(String id, HttpServletResponse response){
		boolean b = staffServiceImpl.delete(Integer.parseInt(id));
		outStr(b, response);
		return null;
	}
	
	public void outStr(boolean b, HttpServletResponse response){
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			if(b){
				out.println("<script>alert('操作成功');window.location.href='staffList.do'</script>");
			}else{
				out.println("<script>alert('操作失败');window.location.href='staffList.do'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
//	window.location.href='GoodsServlet?action=getList&pageIndex=1&admin=1';
}
