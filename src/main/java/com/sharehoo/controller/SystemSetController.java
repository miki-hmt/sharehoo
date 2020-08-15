package com.sharehoo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemSetController {
	
	@RequestMapping("/admin/system")
	public String systemSet(HttpServletRequest request) {
		
		return "/admin/new-version/systemSeting";
	}
	
	@GetMapping("/admin/permission")
	public String permission(HttpServletRequest request) {
		
		return "/admin/new-version/permission";
	}
	
	//2020.08.15 退出
	@GetMapping("/admin/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "/admin/login";
	}
	
	
	@GetMapping("/admin/forms_checkbox")
	public String formcheck(HttpServletRequest request) {
		
		return "/admin/new-version/forms_checkbox";
	}
	@GetMapping("/admin/forms_elements")
	public String formelement(HttpServletRequest request) {
		
		return "/admin/new-version/forms_elements";
	}
	@GetMapping("/admin/forms_radio")
	public String radio(HttpServletRequest request) {
		
		return "/admin/new-version/forms_radio";
	}
	@GetMapping("/admin/forms_switch")
	public String formswitch(HttpServletRequest request) {
		
		return "/admin/new-version/forms_switch";
	}
	@GetMapping("/admin/ftdms-config")
	public String config(HttpServletRequest request) {
		
		return "/admin/new-version/ftdms-config";
	}
	@GetMapping("/admin/js_chartjs")
	public String chart(HttpServletRequest request) {
		
		return "/admin/new-version/js_chartjs";
	}
	@GetMapping("/admin/js_colorpicker")
	public String colorpicker(HttpServletRequest request) {
		
		return "/admin/new-version/js_colorpicker";
	}

	@GetMapping("/admin/js_datepicker")
	public String datepicker(HttpServletRequest request) {
		
		return "/admin/new-version/js_datepicker";
	}
	@GetMapping("/admin/js_msg")
	public String msg(HttpServletRequest request) {
		
		return "/admin/new-version/js_msg";
	}
	
	@GetMapping("/admin/js_notify")
	public String notify(HttpServletRequest request) {
		
		return "/admin/new-version/js_notify";
	}
	@GetMapping("/admin/js_sliders")
	public String sliders(HttpServletRequest request) {
		
		return "/admin/new-version/js_sliders";
	}
	@GetMapping("/admin/js_tags_input")
	public String tags(HttpServletRequest request) {
		
		return "/admin/new-version/js_tags_input";
	}
	@GetMapping("/admin/pages_add_doc")
	public String doc(HttpServletRequest request) {
		
		return "/admin/new-version/pages_add_doc";
	}
	@GetMapping("/admin/pages_config")
	public String pconfig(HttpServletRequest request) {
		
		return "/admin/new-version/pages_config";
	}
	@GetMapping("/admin/pages_data")
	public String pdata(HttpServletRequest request) {
		
		return "/admin/new-version/pages_data";
	}
	@GetMapping("/admin/pages_edit_pwd")
	public String editpwd(HttpServletRequest request) {
		
		return "/admin/new-version/pages_edit_pwd";
	}
	@GetMapping("/admin/pages_guide")
	public String guide(HttpServletRequest request) {
		
		return "/admin/new-version/pages_guide";
	}
	@GetMapping("/admin/pages_login")
	public String login(HttpServletRequest request) {
		
		return "/admin/new-version/pages_login";
	}
	@GetMapping("/admin/pages_permission")
	public String permissions(HttpServletRequest request) {
		
		return "/admin/new-version/pages_permission";
	}
	@GetMapping("/admin/pages_profile")
	public String profile(HttpServletRequest request) {
		
		return "/admin/new-version/pages_profile";
	}
	@GetMapping("/admin/pagination")
	public String pagination(HttpServletRequest request) {
		
		return "/admin/new-version/pagination";
	}
	@GetMapping("/admin/ui_buttons")
	public String buttons(HttpServletRequest request) {
		
		return "/admin/new-version/ui_buttons";
	}
	@GetMapping("/admin/ui_cards")
	public String cards(HttpServletRequest request) {
		
		return "/admin/new-version/ui_cards";
	}
	@GetMapping("/admin/ui_grid")
	public String grid(HttpServletRequest request) {
		
		return "/admin/new-version/ui_grid";
	}
	@GetMapping("/admin/ui_icons")
	public String icons(HttpServletRequest request) {
		
		return "/admin/new-version/ui_icons";
	}
	@GetMapping("/admin/ui_other")
	public String other(HttpServletRequest request) {
		
		return "/admin/new-version/ui_other";
	}
	@GetMapping("/admin/ui_progress")
	public String process(HttpServletRequest request) {
		
		return "/admin/new-version/ui_progress";
	}
	@GetMapping("/admin/ui_step")
	public String step(HttpServletRequest request) {
		
		return "/admin/new-version/ui_step";
	}
	@GetMapping("/admin/ui_tables")
	public String tables(HttpServletRequest request) {
		
		return "/admin/new-version/ui_tables";
	}
	@GetMapping("/admin/ui_tabs")
	public String tabs(HttpServletRequest request) {
		
		return "/admin/new-version/ui_tabs";
	}
}
