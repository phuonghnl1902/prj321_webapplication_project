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
public class RegistrationDTO implements Serializable {
    private String username, password, fullname, address, phone, role;
    private boolean active;
    
    public RegistrationDTO() {
    }

    public RegistrationDTO(String username, String password, String fullname, String address, String phone, String role, boolean active) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.role = role;
        this.active = active;
    }

    public RegistrationDTO(String username, String fullname, String address, String phone) {
        this.username = username;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
    }

    public RegistrationDTO(String username, String fullname, String address, String phone, String role) {
        this.username = username;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.role = role;
    }

    public RegistrationDTO(String username, String fullname, String address, String phone, String role, boolean active) {
        this.username = username;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.role = role;
        this.active = active;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
