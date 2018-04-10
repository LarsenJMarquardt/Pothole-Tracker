package com.techelevator.model;

public interface PotholeDAO {

    User getUser(String email);
    void saveUser(User user);

}
