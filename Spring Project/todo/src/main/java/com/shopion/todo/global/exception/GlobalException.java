package com.shopion.todo.global.exception;


import com.shopion.todo.global.dto.GeneralResponseDto;
import com.shopion.todo.global.dto.ResponseStatus;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Configuration
@RestControllerAdvice
public class GlobalException {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<GeneralResponseDto> handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(GeneralResponseDto.builder()
                        .status(ResponseStatus.Error)
                        .message(ex.getMessage())
                        .data(ex.getMessage())
                        .build());
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<GeneralResponseDto> handleException(Exception ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(GeneralResponseDto.builder()
                        .status(ResponseStatus.Error)
                        .message(ex.getMessage())
                        .data(ex.getMessage())
                        .build());
    }

}
