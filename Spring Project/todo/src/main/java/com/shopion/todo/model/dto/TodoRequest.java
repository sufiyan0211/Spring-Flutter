package com.shopion.todo.model.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class TodoRequest {

    @NotNull(message = "Title cannot be null")
    @NotEmpty(message = "Title cannot be empty")
    private String title;

    private String description;
}
