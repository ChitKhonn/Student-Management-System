package com.coder.student_manage.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.coder.student_manage.dao.UserDAO;
import com.coder.student_manage.model.UserBean1;

@Controller
public class UserController {

	@Autowired
	UserDAO dao;

	@GetMapping(value = "/")
	public ModelAndView startShow() {
		return new ModelAndView("login", "lg", new UserBean1());
	}

	@RequestMapping(value = "/addLogin", method = RequestMethod.POST)
	public String addLogin(@ModelAttribute("lg") UserBean1 l, HttpSession s, ModelMap map) {

		if (l.getName().equals("") && l.getPassword().equals("")) {
			map.addAttribute("loginEmpty", "Field can't be blank!!!");
			return "login";
		}
		String name = l.getName();
		String password = l.getPassword();
		List<UserBean1> userList = dao.searchByNameAndPassword(name, password);
		if (userList == null) {
			map.addAttribute("error", "No Register User!!");
		}

		LocalDate date = LocalDate.now();
		for (UserBean1 res : userList) {
			if (res.getRole().equals("admin")) {
				s.setAttribute("id", res.getId());
				s.setAttribute("name", res.getName());
				s.setAttribute("date", date);
				s.setAttribute("admin", "Admin ");
				return "menu";
			} else if (res.getRole().equals("user")) {
				s.setAttribute("id", res.getId());
				s.setAttribute("name", res.getName());
				s.setAttribute("date", date);
				s.setAttribute("user", "User ");
				return "userMenu";
			}

		}
		return "redirect:/";

	}

	@GetMapping(value = "/user3")
	public ModelAndView showUser() {
		List<UserBean1> showUserList = dao.getAllUsers();
		ModelAndView mv = new ModelAndView("user3");
		mv.addObject("showUserList", showUserList);
		mv.addObject("searchuser", new UserBean1());
		return mv;
	}

	@GetMapping(value = "/user1")
	public ModelAndView user1() {
		return new ModelAndView("user1", "user", new UserBean1());
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") @Validated UserBean1 bean, BindingResult br, HttpSession s,
			ModelMap map) {
		if (br.hasErrors()) {
			return "user1";
		}

		if (bean.getName().equals("") || bean.getEmail().equals("") || bean.getId().equals("")
				|| bean.getPassword().equals("") || bean.getCon_password().equals("")) {
			s.setAttribute("userAddError", "Field can not be blank!!");
			return "user1";
		}
		bean.getName();
		bean.getEmail();
		bean.getPassword();
		bean.getCon_password();
		bean.getRole();
		System.out.println("Testing Name " + bean.getName());
		System.out.println("Testing Email " + bean.getEmail());
		System.out.println("Testing Role " + bean.getRole());
		dao.saveUser(bean);
		return "redirect:/";
	}

//	@GetMapping("/user2")
//	public ModelAndView user2() {
//		return new ModelAndView("user2","userUpdate",new UserBean1());
//	}

	@GetMapping("/setupUserUpdate")
	public ModelAndView setupupdate(@RequestParam("id") String id) {
		System.out.println(id);
		return new ModelAndView("user2", "userUpdate", dao.searchByUserId(id));
	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("userUpdate") @Validated UserBean1 bean, BindingResult br, HttpSession s) {
		if (br.hasErrors()) {
			return "user1";
		}
		bean.getName();
		bean.getEmail();
		bean.getPassword();
		bean.getCon_password();
		bean.getRole();
		System.out.println("Testing Name " + bean.getName());
		System.out.println("Testing Email " + bean.getEmail());
		System.out.println("Testing Role " + bean.getRole());
		s.getAttribute("id");
		dao.updateUser(bean);
		return "redirect:/user3";
	}

	@RequestMapping(value = "/userDelete", method = RequestMethod.GET)
	public String deleteBook(@RequestParam("id") String id, ModelMap model) {
		dao.deleteUser(id);
		return "redirect:/user3";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/searchUser", method = RequestMethod.POST)
	public ModelAndView searchUser(@ModelAttribute("searchuser") UserBean1 bean, HttpSession s) {
		return new ModelAndView("user3", "showUserList", dao.searchByIdAndName(bean.getId(), bean.getName()));
	}
}
