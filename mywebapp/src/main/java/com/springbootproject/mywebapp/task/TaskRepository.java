package com.springbootproject.mywebapp.task;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TaskRepository extends JpaRepository<Tasks, Integer> {

		@Query("SELECT t from Tasks t "
			+ "WHERE t.title LIKE %?1% "
			+"OR t.description LIKE %?1%"
			+"OR t.username LIKE %?1%"
			+"OR t.targetDate LIKE %?1%"
			+"OR t.done LIKE %?1%")
		public List<Tasks> listAll(String title);

		public List<Tasks> findByUsername(String username);
}
