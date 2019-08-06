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
public class TourErrorObj implements Serializable {

    private String idErr, nameErr, desErr, activeErr, dateStartErr, dateEndErr, priceErr, maxSeatErr;

    public TourErrorObj() {
    }

    public String getIdErr() {
        return idErr;
    }

    public void setIdErr(String idErr) {
        this.idErr = idErr;
    }

    public String getNameErr() {
        return nameErr;
    }

    public void setNameErr(String nameErr) {
        this.nameErr = nameErr;
    }

    public String getDesErr() {
        return desErr;
    }

    public void setDesErr(String desErr) {
        this.desErr = desErr;
    }

    public String getActiveErr() {
        return activeErr;
    }

    public void setActiveErr(String activeErr) {
        this.activeErr = activeErr;
    }

    public String getDateStartErr() {
        return dateStartErr;
    }

    public void setDateStartErr(String dateStartErr) {
        this.dateStartErr = dateStartErr;
    }

    public String getDateEndErr() {
        return dateEndErr;
    }

    public void setDateEndErr(String dateEndErr) {
        this.dateEndErr = dateEndErr;
    }

    public String getPriceErr() {
        return priceErr;
    }

    public void setPriceErr(String priceErr) {
        this.priceErr = priceErr;
    }

    public String getMaxSeatErr() {
        return maxSeatErr;
    }

    public void setMaxSeatErr(String maxSeatErr) {
        this.maxSeatErr = maxSeatErr;
    }

}
