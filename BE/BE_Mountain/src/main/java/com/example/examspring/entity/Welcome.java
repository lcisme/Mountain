package com.example.examspring.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "welcomes")
@Data
public class Welcome {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String subTitle;
    private String image;
    private String description;
}
