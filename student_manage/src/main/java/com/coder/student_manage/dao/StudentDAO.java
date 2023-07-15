package com.coder.student_manage.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coder.student_manage.model.StudentBean;
import com.coder.student_manage.repository.StudentRepository;

@Service
public class StudentDAO {

	@Autowired
	StudentRepository repo;

	public List<StudentBean> getAllStudent() {
		return repo.findAll();
	}

	public void saveStudent(StudentBean student) {
		repo.save(student);
	}

//	
	public List<StudentBean> searchStudent(String Cname, String id, String name) {
		return repo.searchStudentsByCourse(Cname, id, name);
	}

	public Optional<StudentBean> searchByStudentId(String id) {
		return repo.findById(id);
	}

	public void updateStudent(StudentBean student) {
		repo.save(student);
	}

	public void deleteStudent(String id) {
		repo.deleteById(id);
	}

}
