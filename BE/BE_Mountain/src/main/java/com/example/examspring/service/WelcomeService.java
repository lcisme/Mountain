package com.example.examspring.service;

import com.example.examspring.entity.Welcome;
import com.example.examspring.respository.WelcomeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class WelcomeService {
    @Autowired
    private WelcomeRepository welcomeRepository;

    public Welcome createWelcome(Welcome welcome) {
        return welcomeRepository.save(welcome);
    }

    public List<Welcome> findAllWelcomes() {
        return welcomeRepository.findAll();
    }
}
