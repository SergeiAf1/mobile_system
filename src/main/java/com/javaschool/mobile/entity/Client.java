package com.javaschool.mobile.entity;

import javax.persistence.*;

@Entity(name = "client")
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "clientId")
    private int id;

}
