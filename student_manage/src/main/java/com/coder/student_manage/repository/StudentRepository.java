package com.coder.student_manage.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.coder.student_manage.model.StudentBean;

@Repository
public interface StudentRepository extends JpaRepository<StudentBean, String> {
//	@Query("select s from StudentBean s where s.student_id=:student_id or s.name=:name or s.attend=:attend")
//	List<StudentBean> search(String student_id,String name,String attend);

	@Query("SELECT s FROM StudentBean s INNER JOIN s.courses c WHERE c.name=:Cname OR s.student_id=:id OR s.name=:name")
	List<StudentBean> searchStudentsByCourse(String Cname, String id, String name);

}
