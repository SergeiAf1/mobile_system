package com.javaschool.mobile.entity;

import javax.persistence.*;

@Entity
public class Tariff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tariffId")
    private int id;
}
