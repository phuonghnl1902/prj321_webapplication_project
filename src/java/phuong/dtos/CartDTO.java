/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuong.dtos;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class CartDTO implements Serializable {
    
    private TourDTO tour;
    private int quantity;
    private String status;
    
    public CartDTO() {
    }

    public TourDTO getTour() {
        return tour;
    }

    public void setTour(TourDTO tour) {
        this.tour = tour;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
