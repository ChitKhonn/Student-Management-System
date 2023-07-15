package com.coder.student_manage.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.coder.student_manage.dao.CourseDAO;
import com.coder.student_manage.dao.StudentDAO;
import com.coder.student_manage.model.CourseBean;
import com.coder.student_manage.model.StudentBean;
import com.coder.student_manage.model.StudentDto;

@Controller
public class StudentController {

	@Autowired
	StudentDAO dao;

	@Autowired
	CourseDAO course;

	@RequestMapping(value = "/studentRegister", method = RequestMethod.GET)
	public ModelAndView studentRegister(ModelMap map) {
		ModelAndView mv = new ModelAndView("studentRegister");
		List<CourseBean> courseList = course.getAllCourse();

		mv.addObject("courseList", courseList);

		StudentBean student = new StudentBean();
		mv.addObject("student", student);
		return mv;

	}

	@RequestMapping(value = "/studAdd", method = RequestMethod.POST)
	public String studentAdd(@ModelAttribute("student") @Validated StudentBean bean, BindingResult br, ModelMap map,
			HttpSession se) {
		if (br.hasErrors()) {
			return "studentRegister";
		}

//		if(bean.getStudent_id().equals("") || 
//		bean.getName().equals("") ||
//		bean.getDob().equals("") ||
//		bean.getEducation().equals("") ||
//		bean.getPhone().equals("") ||
//		bean.getAttend().equals("")  ) {
//			se.setAttribute("studError", "Field can't be blank!!");
//			return "redirect:/studentRegister";
//		}
//		

		StudentBean s = new StudentBean();
		s.setStudent_id(bean.getStudent_id());
		s.setName(bean.getName());
		s.setDob(bean.getDob());
		s.setEducation(bean.getEducation());
		s.setPhone(bean.getPhone());
		s.setGender(bean.getGender());

		s.setCourses(bean.getCourses());
		System.out.println("Courseeeeeeeeeeee " + bean.getCourses());

		dao.saveStudent(s);
		return "redirect:/studentView";
	}

	@RequestMapping(value = "/studentView", method = RequestMethod.GET)
	public ModelAndView view(HttpSession s) {
		ModelAndView mv = new ModelAndView("studentView");
		StudentDto dto = new StudentDto();
		List<StudentBean> studentList = dao.getAllStudent();

		List<CourseBean> courseList = course.getAllCourse();

		mv.addObject("courseList", courseList);
		mv.addObject("dto", dto);
		mv.addObject("studentList", studentList);
		return mv;
	}

	@RequestMapping(value = "/DetailStudent", method = RequestMethod.GET)
	public ModelAndView detailStudent(@RequestParam("studId") String studId, HttpSession s) {
//		List<CourseResponseDTO> list = dao.selectCourse();
//		s.setAttribute("list", list);
//		int noStud = no;
//		s.setAttribute("no", noStud);
//		StudentRequestDTO dto = new StudentRequestDTO();
//		dto.setNo(no);
//		StudentResponseDTO res = dao.selectOneStudent(dto);
//		s.setAttribute("resStud", res);

		ModelAndView mv = new ModelAndView("detailsStudent");
		List<CourseBean> courseList = course.getAllCourse();
		mv.addObject("courseList", courseList);
		String id = studId;
		s.setAttribute("id", id);

		Optional<StudentBean> studList = dao.searchByStudentId(studId);
		mv.addObject("studList", studList);

		return mv;
	}

	@RequestMapping(value = "/setupdeletestudent", method = RequestMethod.GET)
	public ModelAndView setupdeletestudent(ModelMap map, HttpSession s) {
		String id = (String) s.getAttribute("id");
		System.out.println("alkff ahfd " + id);
		dao.deleteStudent(id);
		return new ModelAndView("redirect:/studentView");
	}

	@RequestMapping(value = "/StudentView", method = RequestMethod.POST)
	public ModelAndView StudentSearch(@ModelAttribute("dto") StudentDto dto, HttpSession s) {
		ModelAndView mv = new ModelAndView("studentView");
		String id = dto.getStudent_id();
		String name = dto.getName();
		String Cname = dto.getCourses();
		mv.addObject("studentList", dao.searchStudent(Cname, id, name));
		List<CourseBean> courseList = course.getAllCourse();
		mv.addObject("courseList", courseList);

		return mv;
	}

	@RequestMapping(value = "/setUpUpdate", method = RequestMethod.GET)
	public ModelAndView setUpUpdate(HttpSession s) {
//		List<CourseResponseDTO> list = dao.selectCourse();
//		s.setAttribute("list", list);
//		int noStud = no;
//		s.setAttribute("no", noStud);
//		StudentRequestDTO dto = new StudentRequestDTO();
//		dto.setNo(no);
//		StudentResponseDTO res = dao.selectOneStudent(dto);
//		s.setAttribute("resStud", res);

		ModelAndView mv = new ModelAndView("updatestudent");
		List<CourseBean> courseList = course.getAllCourse();
		mv.addObject("courseList", courseList);
		String studId = (String) s.getAttribute("id");

		Optional<StudentBean> studList = dao.searchByStudentId(studId);
		mv.addObject("studList", studList);

		return mv;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("student") @Validated StudentBean bean, BindingResult br, ModelMap map,
			HttpSession se) {
		if (br.hasErrors()) {
			return "studentRegister";
		}

		if (bean.getStudent_id().equals("") || bean.getName().equals("") || bean.getDob().equals("")
				|| bean.getEducation().equals("") || bean.getPhone().equals("") || bean.getCourses().isEmpty()) {
			se.setAttribute("studError", "Field can't be blank!!");
			return "redirect:/studentRegister";
		}

		StudentBean s = new StudentBean();
		s.setStudent_id(bean.getStudent_id());
		s.setName(bean.getName());
		s.setDob(bean.getDob());
		s.setEducation(bean.getEducation());
		s.setPhone(bean.getPhone());
		s.setGender(bean.getGender());
		s.setCourses(bean.getCourses());

		dao.updateStudent(s);
		return "redirect:/studentView";
	}

}
