package com.example.examspring.respository;

import com.example.examspring.entity.Home;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HomeRepository extends JpaRepository<Home, Long> {
}