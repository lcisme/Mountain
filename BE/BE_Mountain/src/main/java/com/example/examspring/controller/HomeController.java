package com.example.examspring.controller;

import com.example.examspring.entity.Home;
import com.example.examspring.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/destination")
public class HomeController {
    
    @Autowired
    private HomeService homeService;

    @GetMapping
    public List<Home> getAllDestinations(){
        return homeService.getAllDestinations();
    }
}
