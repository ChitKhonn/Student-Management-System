package com.coder.student_manage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coder.student_manage.dao.CourseDAO;
import com.coder.student_manage.model.CourseBean;
import com.coder.student_manage.model.UserBean1;

@Controller
public class CourseController {

	@Autowired
	CourseDAO dao;

	@GetMapping(value = "/course")
	public ModelAndView course() {
		return new ModelAndView("course", "courseData", new CourseBean());
	}

	@RequestMapping(value = "/courseAdd", method = RequestMethod.POST)
	public String courseAdd(@ModelAttribute("courseData") CourseBean bean, HttpSession s, ModelMap map) {
		if (bean.getId().equals("") || bean.getName().equals("")) {
			s.setAttribute("courseError", "Filed Can't be blank!!!");
			map.addAttribute("course", bean);
			return "redirect:/course";
		} else {
			bean.getId();
			bean.getName();
			int i = dao.saveCourse(bean);

			if (i > 0) {
				s.setAttribute("success", "Successfully Add Course");
			}

			return "redirect:/course";

		}
	}

}
