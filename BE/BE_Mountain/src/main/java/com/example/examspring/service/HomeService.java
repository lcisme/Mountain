package com.example.examspring.service;

import com.example.examspring.entity.Home;
import com.example.examspring.respository.HomeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeService {
    @Autowired
    private HomeRepository homeRepository;

    public List<Home> getAllDestinations(){
        return homeRepository.findAll();
    }
}
