package com.coder.student_manage.model;

import org.springframework.stereotype.Service;

@Service
public class StudentDto {
	private String student_id;
	private String name;
	private String courses;

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCourses() {
		return courses;
	}

	public void setCourses(String courses) {
		this.courses = courses;
	}

}
