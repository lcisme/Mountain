package com.example.examspring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "welcomes")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Welcome {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String subTitle;
    private String image;
    private String description;
}
