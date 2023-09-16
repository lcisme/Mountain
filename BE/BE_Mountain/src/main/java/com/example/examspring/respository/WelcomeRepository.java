package com.example.examspring.respository;

import com.example.examspring.entity.Welcome;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WelcomeRepository extends JpaRepository<Welcome, Long> {
}
