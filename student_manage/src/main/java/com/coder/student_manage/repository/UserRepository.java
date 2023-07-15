package com.coder.student_manage.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.coder.student_manage.model.UserBean1;

@Repository
public interface UserRepository extends JpaRepository<UserBean1, String> {

	@Query("select u from UserBean1 u where u.name=:name and u.password=:password")
	List<UserBean1> searchLogin(String name, String password);

	@Query("select u from UserBean1 u where u.id=:id or u.name=:name")
	List<UserBean1> search(String id, String name);
}
