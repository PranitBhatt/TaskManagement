package com.springbootproject.mywebapp.task;

import java.time.LocalDate;

import java.util.List;

import org.springframework.data.repository.query.Param;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class TaskControllerJpa {
	
	//Constructor
	 public TaskControllerJpa(TaskRepository taskRepository) {
		super();	
		this.taskRepository = taskRepository;
	 }
	 
	private TaskRepository taskRepository;
	
	@RequestMapping("list-tasks")
	public String listAllTasks(ModelMap model, HttpSession session) { // To List ALL the Tak
		
		String username = (String) session.getAttribute("username");
		List<Tasks> tasks = taskRepository.findByUsername(username);
		model.addAttribute("tasks", tasks);
		return "listTasks";
	}
	@RequestMapping("list-tasks-search")
	public String listAllTaskss(ModelMap model,@Param("keyword") String keyword) {
		
		List<Tasks> tasks = taskRepository.listAll(keyword);
		model.addAttribute("tasks", tasks);
		
		return "listTasks";
	}
	
	@RequestMapping(value="add-task", method=RequestMethod.GET) 
	public String shownewTask(ModelMap model, HttpSession session){
		
		String username = (String) session.getAttribute("username");
		Tasks task  = new Tasks(0,username,"","", LocalDate.now().plusYears(1),false); 
		model.put("task", task);
		return "tasks";
	}
	@RequestMapping(value="add-task", method=RequestMethod.POST) 
	public String addnewTask(ModelMap model, @Valid Tasks task, BindingResult result,HttpSession session)
	{
		if(result.hasErrors())
		{
			return "tasks";
		}
		String username = (String) session.getAttribute("username");
		task.setUsername(username);
		taskRepository.save(task);
		
		return "redirect:list-tasks";
	}
	
	@RequestMapping("delete-task") 
	public String deleteTask(@RequestParam int id)
	{
		taskRepository.deleteById(id);
		return "redirect:list-tasks";
	}
	@RequestMapping(value = "update-task", method = RequestMethod.GET) 
	public String updateTask(@RequestParam int id,ModelMap model)
	{
		Tasks task = taskRepository.findById(id).get(); 
		model.addAttribute("task",task);
		return "tasks";
	}
	
	@RequestMapping(value="update-task", method=RequestMethod.POST) 
	public String updatetask(ModelMap model, @Valid Tasks task, BindingResult result,HttpSession session)
	{
		if(result.hasErrors())
		{
			return "tasks";
		}
		String username = (String) session.getAttribute("username");
		task.setUsername(username);
		taskRepository.save(task);
		return "redirect:list-tasks";
	}
}
