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
public class TourDTO implements Serializable {

    private String id, name, des;
    private Date dateStart, dateEnd;
    private int maxSeat;
    private float price;
    private boolean active;

    public TourDTO() {
    }

    public TourDTO(String id, String name, Date dateStart, Date dateEnd, int maxSeat, float price) {
        this.id = id;
        this.name = name;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.maxSeat = maxSeat;
        this.price = price;
    }

    public TourDTO(String id, String name, String des, Date dateStart, Date dateEnd, int maxSeat, float price, boolean active) {
        this.id = id;
        this.name = name;
        this.des = des;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.maxSeat = maxSeat;
        this.price = price;
        this.active = active;
    }

    public TourDTO(String id, String name, String des, Date dateStart, Date dateEnd, int maxSeat, float price) {
        this.id = id;
        this.name = name;
        this.des = des;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.maxSeat = maxSeat;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getMaxSeat() {
        return maxSeat;
    }

    public void setMaxSeat(int maxSeat) {
        this.maxSeat = maxSeat;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
