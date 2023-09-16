package com.example.examspring.controller;

import com.example.examspring.entity.Employee;
import com.example.examspring.entity.Welcome;
import com.example.examspring.service.EmployeeService;
import com.example.examspring.service.WelcomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/welcome")
public class WelcomeController {

    @Autowired
    private WelcomeService welcomeService;

    @PostMapping
    public Welcome createWelcome(@RequestBody Welcome welcome) {
        return welcomeService.createWelcome(welcome);
    }

    @GetMapping
    public List<Welcome> getAllWelcomes() {
        return welcomeService.findAllWelcomes();
    }


}