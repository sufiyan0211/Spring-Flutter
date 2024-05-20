package com.shopion.todo.service;

import com.shopion.todo.global.exception.NotFoundException;
import com.shopion.todo.model.Todo;
import com.shopion.todo.model.dto.TodoRequest;
import com.shopion.todo.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TodoServiceImpl implements TodoService{

    @Autowired
    private TodoRepository todoRepository;

    @Override
    @Transactional
    public Todo addTodo(TodoRequest todoRequest) {
        Todo todo = Todo.builder()
                .title(todoRequest.getTitle())
                .build();

        if(todoRequest.getDescription() != null && !todoRequest.getDescription().isEmpty()){
            todo.setDescription(todoRequest.getDescription());
        }

        todoRepository.save(todo);
        return todo;
    }

    @Override
    public String deleteTodoById(Long todoId) {
        todoRepository.findById(todoId)
                .orElseThrow(() -> new NotFoundException("Todo not found", HttpStatus.NOT_FOUND));
        todoRepository.deleteById(todoId);
        return "deleted successfully";
    }


    @Override
    @Transactional
    public Todo updateTodoById(Long todoId, TodoRequest todoRequest) {
        Todo todo = todoRepository.findById(todoId)
                .orElseThrow(() -> new NotFoundException("Todo not found", HttpStatus.NOT_FOUND));

        if(todoRequest.getTitle() != null && !todoRequest.getTitle().isEmpty()){
            todo.setTitle(todoRequest.getTitle());
        }

        if(todoRequest.getDescription() != null && !todoRequest.getDescription().isEmpty()){
            todo.setDescription(todoRequest.getDescription());
        }

        return todoRepository.save(todo);
    }

    @Override
    public void getTodoById(Long todoId) {

    }

    @Override
    public List<Todo> getTodos() {
        return todoRepository.findAll();
    }
}
