package com.shopion.todo.controller;

import com.shopion.todo.global.dto.GeneralResponseDto;
import com.shopion.todo.global.dto.ResponseStatus;
import com.shopion.todo.model.Todo;
import com.shopion.todo.model.dto.TodoRequest;
import com.shopion.todo.service.TodoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/")
public class TodoController {

    @Autowired
    private TodoService todoService;

    @PostMapping("/todos")
    public ResponseEntity<GeneralResponseDto> addTodo(@RequestBody @Valid TodoRequest todoRequest) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(GeneralResponseDto.builder()
                        .status(ResponseStatus.Success)
                        .message("Success")
                        .data(todoService.addTodo(todoRequest))
                        .build());
    }

    @GetMapping("/todos")
    public ResponseEntity<GeneralResponseDto> getTodos() {
        return ResponseEntity.ok()
                .body(GeneralResponseDto.builder()
                        .status(ResponseStatus.Success)
                        .message("Success")
                        .data(todoService.getTodos())
                        .build());
    }

    @DeleteMapping("/todos/{id}")
    public ResponseEntity<GeneralResponseDto> deleteTodo(@PathVariable(name = "id") Long id) {
        return ResponseEntity.ok()
                .body(GeneralResponseDto.builder()
                        .status(ResponseStatus.Success)
                        .message("Success")
                        .data(todoService.deleteTodoById(id))
                        .build());
    }

    @PutMapping("/todos/{id}")
    public ResponseEntity<GeneralResponseDto> updateTodoById(@PathVariable(name = "id") Long id,
                                                             @RequestBody @Valid TodoRequest todoRequest) {
        return ResponseEntity.ok()
                .body(GeneralResponseDto.builder()
                        .status(ResponseStatus.Success)
                        .message("Success")
                        .data(todoService.updateTodoById(id, todoRequest))
                        .build());
    }


}
