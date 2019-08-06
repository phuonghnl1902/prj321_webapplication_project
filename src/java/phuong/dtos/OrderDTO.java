/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuong.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author User
 */
public class OrderDTO implements Serializable {
    private String id, tourid, status, name, username;
    private int quan;
    private float price;
    private Date date;

    public OrderDTO() {
    }

    public OrderDTO(String id, String tourid, String status, String name, int quan, float price, Date date) {
        this.id = id;
        this.tourid = tourid;
        this.status = status;
        this.name = name;
        this.quan = quan;
        this.price = price;
        this.date = date;
    }

    public OrderDTO(String id, String tourid, String status, String name, String username, int quan, float price, Date date) {
        this.id = id;
        this.tourid = tourid;
        this.status = status;
        this.name = name;
        this.username = username;
        this.quan = quan;
        this.price = price;
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTourid() {
        return tourid;
    }

    public void setTourid(String tourid) {
        this.tourid = tourid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getQuan() {
        return quan;
    }

    public void setQuan(int quan) {
        this.quan = quan;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
