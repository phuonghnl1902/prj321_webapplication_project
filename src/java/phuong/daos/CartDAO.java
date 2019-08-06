/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuong.daos;

import java.io.Serializable;
import java.util.HashMap;
import phuong.dtos.CartDTO;

/**
 *
 * @author User
 */
public class CartDAO implements Serializable {

    private HashMap<String, CartDTO> cart;
    private String custormer;

    public CartDAO() {
    }

    public CartDAO(String customer) {
        this.custormer = customer;
        this.cart = new HashMap<>();
    }

    public HashMap<String, CartDTO> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, CartDTO> cart) {
        this.cart = cart;
    }

    public String getCustormer() {
        return custormer;
    }

    public void setCustormer(String custormer) {
        this.custormer = custormer;
    }

    public void addCart(CartDTO dto) throws Exception {
        if (this.cart.containsKey(dto.getTour().getId())) {
            int quantity = this.cart.get(dto.getTour().getId()).getQuantity() + 1;
            dto.setQuantity(quantity);
        }
        this.cart.put(dto.getTour().getId(), dto);
    }

    public void removeCart(String id) throws Exception {
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public float getTotal() throws Exception {
        float total = 0;
        for (CartDTO dto : this.cart.values()) {
            total += dto.getQuantity() * dto.getTour().getPrice();
        }
        return total;
    }

    public void updateCart(String id, int quantity) throws Exception {
        if (this.cart.containsKey(id)) {
            this.cart.get(id).setQuantity(quantity);
        }
    }

}
