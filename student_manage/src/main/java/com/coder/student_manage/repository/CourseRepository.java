package com.coder.student_manage.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.coder.student_manage.model.CourseBean;

@Repository
public interface CourseRepository extends JpaRepository<CourseBean, String> {

}
