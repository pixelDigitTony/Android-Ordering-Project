package com.example.ordersystem.Model;

public class Dish {
    private int dishId;
    private String dishName;
    private int dishPrice;
    private int dishImage;


    public Dish() {
    }

    public Dish(int Id, String dishName, int dishPrice, int dishImage) {
        this.dishId = Id;
        this.dishName = dishName;
        this.dishPrice = dishPrice;
        this.dishImage = dishImage;
    }

    public int getDishId() {
        return dishId;
    }

    public String getDishName() {
        return dishName;
    }

    public int getDishPrice() {
        return dishPrice;
    }

    public int getDishImage() {
        return dishImage;
    }
}
