package com.shopion.todo.service;

import com.shopion.todo.model.Todo;
import com.shopion.todo.model.dto.TodoRequest;

import java.util.List;

public interface TodoService {
    Todo addTodo(TodoRequest todoRequest);

    String deleteTodoById(Long todoId);

    Todo updateTodoById(Long todoId, TodoRequest todoRequest);

    void getTodoById(Long todoId);

    List<Todo> getTodos();
}
