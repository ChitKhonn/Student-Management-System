package com.coder.student_manage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coder.student_manage.model.CourseBean;
import com.coder.student_manage.repository.CourseRepository;

@Service
public class CourseDAO {
	@Autowired
	CourseRepository repo;

	public List<CourseBean> getAllCourse() {
		return repo.findAll();
	}

	public int saveCourse(CourseBean course) {
		int i = 0;
		repo.save(course);
		return i;
	}
}
