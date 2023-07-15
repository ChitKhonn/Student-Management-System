package com.coder.student_manage.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "student")
@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentBean {

	private int no;
	@Id
	@Column(name = "student_id")
	private String student_id;
	private String name, dob, gender, education;
	private String phone;

	@ManyToMany(cascade = CascadeType.PERSIST)
	@JoinTable(name = "stud_course ", joinColumns = { @JoinColumn(name = "student_id ") }, inverseJoinColumns = {
			@JoinColumn(name = "id") })
	private List<CourseBean> courses;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

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

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

//	public String getAttend() {
//		String a = "";
//		for (String resultVal : attend) {
//			a += resultVal + " ";
//		}
//		return a;
//	}
//	public void setAttend(String[] attend) {
//		this.attend = attend;
//	}
	public List<CourseBean> getCourses() {
		return courses;
	}

	public void setCourses(List<CourseBean> courses) {
		this.courses = courses;
	}

}
