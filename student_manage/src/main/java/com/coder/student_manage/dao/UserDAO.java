package com.coder.student_manage.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.coder.student_manage.model.UserBean1;
import com.coder.student_manage.repository.UserRepository;

@Service
@SessionScope
public class UserDAO {

	@Autowired
	UserRepository userRepo;

	public List<UserBean1> getAllUsers() {
		return userRepo.findAll();
	}

	public void saveUser(UserBean1 user) {
		userRepo.save(user);
	}

	public List<UserBean1> searchByNameAndPassword(String name, String password) {
		return userRepo.searchLogin(name, password);
	}

	public List<UserBean1> searchByIdAndName(String id, String name) {
		return userRepo.search(id, name);
	}

	public Optional<UserBean1> searchByUserId(String userId) {
		return userRepo.findById(userId);
	}

	public void updateUser(UserBean1 user) {
		userRepo.save(user);
	}

	public void deleteUser(String userId) {
		userRepo.deleteById(userId);
	}

}
